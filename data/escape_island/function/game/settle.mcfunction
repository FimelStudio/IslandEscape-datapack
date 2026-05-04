title @a title {"text":"游戏结束","color":"gold","bold":true}

gamemode spectator @a[tag=state.escaped]
gamemode adventure @a[tag=!state.escaped]
effect clear @a
execute as @a run attribute @s minecraft:movement_speed base set 0.1
execute as @a run attribute @s minecraft:max_health base set 20
execute as @a run attribute @s minecraft:attack_damage base set 1
execute as @a run attribute @s minecraft:attack_speed base set 4
execute as @a run function escape_island:ui/spore_bar/clear

bossbar set escape_island:phase visible false
bossbar set escape_island:signal visible false
bossbar set escape_island:gen visible false
bossbar set escape_island:heli visible false
bossbar set escape_island:ship visible false
bossbar set escape_island:sub visible false
bossbar set escape_island:bomb visible false
bossbar set escape_island:infection visible false
bossbar set escape_island:disguise visible false
bossbar set escape_island:mother_respawn visible false

function escape_island:escape/helicopter_cleanup
kill @e[tag=entity.engineer_battery]
kill @e[tag=entity.mechanic_trap]
kill @e[tag=entity.chef_stew_pot]
kill @e[tag=dev.marker_vis]
kill @e[tag=entity.downed_anchor]
kill @e[tag=entity.dead_anchor]

tag @a remove team.human
tag @a remove team.infected
tag @a remove infected.mother
tag @a remove infected.common
tag @a remove infected.secondary_mother
tag @a remove skill.mother.eating
tag @a remove skill.mother.eat.fired
tag @a remove skill.mother.eat.absorbing
tag @a remove skill.mother.eat.target
tag @a remove state.infected_period
tag @a remove state.sporifying
tag @a remove state.dead
tag @a remove state.boarding
tag @a remove state.escaped
tag @a remove state.spectator
tag @a remove state.attack_slowed
tag @a remove flag.first_attack
tag @a remove state.attack_slowed
tag @a remove state.mutated

scoreboard players reset @a spore_load
scoreboard players reset @a spore_decay_cd
scoreboard players reset @a infect_time
scoreboard players reset @a sporify_timer
scoreboard players reset @a mother_respawn
scoreboard players reset @a is_mother
scoreboard players reset @a mother_hp
scoreboard players reset @a mother_last_hp
scoreboard players reset @a mother_regen_cd
scoreboard players reset @a mother_hit_cd
scoreboard players reset @a mother_phase
scoreboard players reset @a mother_phase_timer
scoreboard players reset @a cd_mother_rotsense
scoreboard players reset @a cd_mother_howl
scoreboard players reset @a cd_mother_lunge
scoreboard players reset @a death_count
scoreboard players reset @a hb_phase
scoreboard players operation @a used_firework_last = @a used_firework
function skill:mother/eat/clear_storage

clear @a
team leave @a

scoreboard players set $game in_game 0
gamerule natural_health_regeneration true
gamerule pvp true

tellraw @a {"text":"─────────────────────────────","color":"gray"}
tellraw @a {"text":"状态已清除。输入 /function escape_island:game/start 再来一局。","color":"gold"}
