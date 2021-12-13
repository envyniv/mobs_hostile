-- spiders for Mobs Redo --

mobs_spiders = {}

minetest.register_craftitem(":mobs_spider:spider_eye", {
  description = "Spider Eye",
  inventory_image = "spider_eye.png",
  on_use = minetest.item_eat(-2),
})

mobs:register_arrow('mobs_spider:bile', {
  visual = 'sprite',
  textures = {'bile.png'},
  velocity = 5,
  drop = false,
  tail=1,
  tail_texture='bile',

  hit_player = function(self, player)

  end
  })

mobs:register_mob("mobs_spider:spider", {
  type = 'monster',
  hp_min = 1,
  hp_max = minetest.PLAYER_MAX_HP_DEFAULT/2,
  walk_velocity = 4.2,
  run_velocity = 5.8,
  stand_chance = 25,
  walk_chance = 75,
  jump = true,
  jump_height = 2.3,
  stepheight = 1.15,
  pushable = true,
  view_range = 25,
  damage = 4,
  knock_back = false,
  fear_height = 9999,
  fall_damage = false,
  lava_damage = 9999,
  light_damage = 0,
  light_damage_min = (default.LIGHT_MAX / 2),
  light_damage_max = (default.LIGHT_MAX + 1),
  suffocation = 0,
  floats = 0,
  reach = 2,
  attack_chance = 1,
  attack_animals = false,
  attack_npcs = false,
  attack_players = false,
  group_attack = true,
  attack_type = 'dogfight',
  blood_amount = 2,
  pathfinding = 1,
  makes_footstep_sound = true,
  sounds = {
    damage = 'screech_pain',
    death = 'spider_death',
    attack = 'screech_aggro',
--     shoot_attack = 'screech_pain',
--  swim = 'creatures_splash',
            random = {'widow_1', 'widow_2', 'widow_3'},
  },
  textures = {'widow.png^widow_eyes.png'},
  mesh = 'spider.b3d',
  visual = 'mesh',
  visual_size = {x = 8.7, y = 8.7}, --[[model is really small apparently]]
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
  collisionbox = {-0.25, -0.01, -0.3, 0.25, -0.50, 0.3},
  rotation = -90.0,
  drops = {
    {name = 'mobs_spider:spider_eye', chance = 0.5, min = 1, max = 1}
    }
  })

mobs:spawn({name = 'mobs_spider:spider',
            nodes = {
                      "group:stone",
                      "group:dirt"
                    },
            neighbors = 'air',
            min_light = 0,
            max_light = 7,
            chance = 7000,
            active_object_count = 5,
            min_height = -31000,
            max_height = 31000,
            day_toggle = true
  })

-- mobs:on_die({
--
--   })

local S = minetest.get_translator('mobs_spider')

mobs:register_egg('mobs_spider:spider', S('Spider'), 'wool_grey.png', 1)

mobs:alias_mob('mobs:spider', 'mobs_spider:spider')


mobs:register_mob("mobs_spider:cavespider", {
  type = 'monster',
  hp_min = 1,
  hp_max = minetest.PLAYER_MAX_HP_DEFAULT/3,
  walk_velocity = 4.2,
  run_velocity = 5.8,
  stand_chance = 25,
  walk_chance = 75,
  jump = true,
  jump_height = 1.8,
  stepheight = 1.2,
  pushable = true,
  view_range = 15,
  damage = 2,
  knock_back = false,
  fear_height = 9999,
  fall_damage = false,
  lava_damage = 9999,
  light_damage = 0,
  light_damage_min = (default.LIGHT_MAX / 2),
  light_damage_max = (default.LIGHT_MAX + 1),
  suffocation = 0,
  floats = 0,
  reach = 2,
                                         attack_chance = 1,
                                         attack_animals = true,
                                         attack_npcs = false,
                                         attack_players = true,
                                         group_attack = true,
                                         attack_type = 'dogfight',
                                         blood_amount = 1,
                                         pathfinding = 1,
                                         makes_footstep_sound = true,
                                         sounds = {
                                                       damage = 'screech_pain',
                                                       death = 'spider_death',
                                                       attack = 'screech_aggro',
--                                                        shoot_attack = 'screech_pain',
                                                      --  swim = 'creatures_splash',
                                                      random = 'cave_call',

                                                       },
                                         textures = {'cave.png'},
                                         mesh = 'spider.b3d',
                                         visual = 'mesh',
                                         visual_size = {x = 5.7, y = 5.7},
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
                                                  {name = 'mobs_spider:spider_eye', chance = 0.5, min = 1, max = 1}
                                                  }
                                         })

mobs:spawn({name = 'mobs_spider:cavespider',
            nodes = {
                     "group:stone",
                     "group:dirt"
                    },
            neighbors = 'air',
            min_light = 0,
            max_light = 5,
            chance = 7000,
            active_object_count = 10,
            min_height = -31000,
            max_height = 31000,
            day_toggle = true
           })

-- mobs:on_die({
--
--   })

mobs:register_egg('mobs_spider:cavespider', S('Cave Spider'), 'wool_dark_grey.png', 1)

mobs:alias_mob('mobs:cavespider', 'mobs_spider:cavespider')

mobs:register_mob("mobs_spider:junglespider", {
                                             type = 'monster',
                                             hp_min = minetest.PLAYER_MIN_HP_DEFAULT,
                                             hp_max = minetest.PLAYER_MAX_HP_DEFAULT/3,
                                             walk_velocity = 4.2,
                                             run_velocity = 5.8,
                                             stand_chance = 25,
                                             walk_chance = 75,
                                             jump = true,
                                             jump_height = 1.8,
                                             stepheight = 1.2,
                                             pushable = true,
                                             view_range = 10,
                                             damage = 2,
                                             knock_back = false,
                                             fear_height = 9999,
                                             fall_damage = false,
                                             lava_damage = 9999,
                                             light_damage = 0,
                                             light_damage_min = (default.LIGHT_MAX / 2),
                                             light_damage_max = (default.LIGHT_MAX + 1),
                                             suffocation = 0,
                                             floats = 0,
                                             reach = 2,
                                             attack_chance = 1,
                                             attack_animals = false,
                                             attack_npcs = true,
                                             attack_players = true,
                                             group_attack = true,
                                             attack_type = 'dogshoot',
                                            dogshoot_count_max = 1,
                                            dogshoot_count2_max = 1,
                                             blood_amount = 1,
                                             pathfinding = 1,
                                             makes_footstep_sound = true,
                                             sounds = {
                                                       damage = 'screech_pain',
                                                       death = 'spider_death',
                                                       attack = 'screech_aggro',
                                                       shoot_attack = 'screech_pain',
                                                      --  swim = 'creatures_splash',
                                                       random = {'jungle.1', 'jungle.2', 'jungle.3'},
                                                       },
                                             textures = {'jungle.png'},
                                             mesh = 'spider.b3d',
                                             visual = 'mesh',
                                             visual_size = {x = 7.7, y = 7.7},
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
                                                      {name = 'mobs_spider:spider_eye', chance = 0.5, min = 1, max = 1}
                                                     },
                                            arrow = 'mobs_spider:bile',
                                            })

mobs:spawn({name = 'mobs_spider:junglespider',
            nodes = {
                     "group:stone",
                     "group:dirt"
                    },
            neighbors = 'air',
            min_light = 0,
            max_light = 5,
            chance = 7000,
            active_object_count = 6,
            min_height = -31000,
            max_height = 31000,
            day_toggle = true
           })

-- mobs:on_die({
--
--   })



mobs:register_egg('mobs_spider:junglespider', S('Jungle Spider'), 'wool_blue.png', 1)

mobs:alias_mob('mobs:junglespider', 'mobs_spider:junglespider')
