--= Zombie for Mobs Redo =--
-- Copyright (c) 2015-2016 BlockMen <blockmen2015@gmail.com>
--
-- init.lua
--
-- This software is provided 'as-is', without any express or implied warranty. In no
-- event will the authors be held liable for any damages arising from the use of
-- this software.
--
-- Permission is granted to anyone to use this software for any purpose, including
-- commercial applications, and to alter it and redistribute it freely, subject to the
-- following restrictions:
--
-- 1. The origin of this software must not be misrepresented; you must not
-- claim that you wrote the original software. If you use this software in a
-- product, an acknowledgment in the product documentation is required.
-- 2. Altered source versions must be plainly marked as such, and must not
-- be misrepresented as being the original software.
-- 3. This notice may not be removed or altered from any source distribution.
--

mobs_zombie = {}

minetest.register_craftitem("mobs_zombie:rotten_flesh", {
	description = "Rotten Flesh",
	inventory_image = "creatures_rotten_flesh.png",
	on_use = minetest.item_eat(1),
})
mobs:register_mob('mobs_zombie:zombie', {
  -- general
  type = 'monster',
  hp_min = 1,
  hp_max = minetest.PLAYER_MAX_HP_DEFAULT,
  walk_velocity = 3,
  run_velocity = 4.2,
  stand_chance = 50,
  walk_chance = 50,
  jump = true,
  jump_height = 1.1,
  stepheight = 1.1,
  pushable = true,
  view_range = 12,
  damage = 3,
  knock_back = true,
  fear_height = 20,
  fall_damage = true,
  lava_damage = 9999,
  light_damage = 1,
  light_damage_min = (default.LIGHT_MAX / 2),
  light_damage_max = (default.LIGHT_MAX + 1),
  suffocation = 0,
  floats = 0,
  reach = 2,
  attack_chance = 1,
  attack_animals = true,
  attack_npcs = true,
  attack_players = true,
  group_attack = true,
  attack_type = 'dogfight',
  blood_amount = 0,
  pathfinding = 1,
  makes_footstep_sound = true,
  sounds = {
    damage = 'creatures_zombie_hit',
    death = 'creatures_zombie_death',
--     swim = 'creatures_splash',
    random = 'creatures_zombie',
    },
  textures = {'creatures_zombie.png'},
  mesh = 'creatures_zombie.b3d',
  visual = 'mesh',
  visual_size = {x = 1, y = 1},
  animation = {
    stand_start = 0,
    stand_end = 80,
    stand_speed = 15,
    walk_start = 102,
    walk_end = 122,
    walk_speed = 15.5,
    punch_start = 102,
    punch_end = 122,
    punch_speed = 22,
    die_start = 160,
    die_end = 170,
    die_speed=28,
    die_loop=false,
  },
  collisionbox = {-0.25, -0.01, -0.3, 0.25, 1.75, 0.3},
  rotation = -90.0,
  drops = {
    {name = 'mobs_zombie:rotten_flesh', chance = 3, min = 1, max = 2}
  },

  on_spawn = function(self)
    if not mobs_skeletons then
      self.light_damage = mobs_zombie.fn_DamagePerSecond(self)
    else
      self.light_damage = mobs_skeletons.fn_DamagePerSecond(self)
    end
	end
})
--   spawning = {
--     abm_nodes = {
--       spawn_on = {"default:stone", "default:dirt_with_grass", "default:dirt",
--         "default:cobblestone", "default:mossycobble", "group:sand"},
--     },
--     abm_interval = 36,
--     abm_chance = 7600,
--     max_number = 1,
--     number = 2,
--     light = {min = 0, max = 8},
--     height_limit = {min = -200, max = 50},
--
--     spawn_egg = {
--       description = "Zombie Spawn-Egg",
--       texture = "creatures_egg_zombie.png",
--     },

--     spawner = {
--       description = "Zombie Spawner",
--       range = 8,
--       number = 6,
--       light = {min = 0, max = 8},
--     }
--   },

mobs:spawn({name = 'mobs_zombie:zombie',
              nodes = {
                       'group:crumbly'
                      },
              neighbors = 'air',
              chance = 7000,
              active_object_count = 2,
              min_height = -31000,
              max_height = 31000,
              day_toggle = false
             })


local S = minetest.get_translator('mobs_zombie')

mobs:register_egg('mobs_zombie:zombie', S('Zombie'), 'wool_green.png', 1)

mobs:alias_mob('mobs:zombie', 'mobs_zombie:zombie')

-- Place spawners in dungeons
local var_zombie_spawner = "mobs_zombie:zombie 0 8 5 10 0"

local function place_spawner(tab)
	local pos = tab[math.random(1, (#tab or 4))]
	pos.y = pos.y - 1
  local n = minetest.get_node_or_nil(pos)
	if n and n.name ~= "air" then
		pos.y = pos.y + 1
    minetest.set_node(pos, {name = "mobs:spawner", command = var_zombie_spawner})
--     minetest.get_meta(pos)
--     meta:set_string("command", )
	end
end
minetest.set_gen_notify("dungeon")
minetest.register_on_generated(function(minp, maxp, blockseed)
	local ntf = minetest.get_mapgen_object("gennotify")
	if ntf and ntf.dungeon and #ntf.dungeon > 3 then
		minetest.after(3, place_spawner, table.copy(ntf.dungeon))
	end
end)


--
-- Functions
--

-- Used to calculate the damage per second

if not mobs_skeletons then
  mobs_zombie.fn_DamagePerSecond = function(self)

  -- Constants
  local i_SECONDS_PER_DAY = 86400
  local i_SECONDS_PER_5_MINUTES = 300

  -- Variables
  local i_hitPoints, i_timeSpeed, i_inGameDayLength, i_fiveInGameMinutes,
      i_damagePerSecond

  i_hitPoints = self.health
  i_timeSpeed = tonumber(minetest.settings:get('i_timeSpeed')) or 72

  if (i_timeSpeed == 0) then
    i_timeSpeed = 1
  end

  i_inGameDayLength = i_SECONDS_PER_DAY / i_timeSpeed
  i_fiveInGameMinutes = (i_inGameDayLength * i_SECONDS_PER_5_MINUTES)
  / i_SECONDS_PER_DAY

  i_damagePerSecond = i_hitPoints / i_fiveInGameMinutes

  return i_damagePerSecond
  end
end
