# 正式与训练共用玩家更新；只在明确的运行模式下调度。
function skill:common/cooldown_tick
execute if entity @e[tag=entity.mechanic_trap,limit=1] run function skill:mechanic/trap_tick
execute if entity @e[tag=entity.chef_stew_pot,limit=1] run function skill:chef/stew_tick


function escape_island:infection/tick_infected_state
function escape_island:infection/spore_load_decay
execute as @a[tag=ie.active,scores={cd_aura_heartbeat=1..}] run scoreboard players remove @s cd_aura_heartbeat 1
execute as @a[tag=ie.active,scores={cd_aura_notice=1..}] run scoreboard players remove @s cd_aura_notice 1

execute if score $blackout ie.event matches 1 as @a[tag=ie.active,tag=!state.dead] at @s if items entity @s weapon.mainhand minecraft:lantern[minecraft:custom_data~{item:"flashlight"}] run effect give @a[tag=ie.active,distance=..3] minecraft:night_vision 3 0 true
execute if score $blackout ie.event matches 1 as @a[tag=ie.active,tag=!state.dead] at @s if items entity @s weapon.offhand minecraft:lantern[minecraft:custom_data~{item:"flashlight"}] run effect give @a[tag=ie.active,distance=..3] minecraft:night_vision 3 0 true

# 防毒面具可戴在头上，也可放在背包；兼容早期皮革头盔和当前锁链头盔两种载体。
tag @a[tag=ie.active] remove has_gas_mask
execute as @a[tag=ie.active,tag=!state.dead] if items entity @s armor.head minecraft:chainmail_helmet[minecraft:custom_data~{item:"gas_mask"}] run tag @s add has_gas_mask
execute as @a[tag=ie.active,tag=!state.dead] if items entity @s armor.head minecraft:leather_helmet[minecraft:custom_data~{item:"gas_mask"}] run tag @s add has_gas_mask
execute as @a[tag=ie.active,tag=!state.dead] if items entity @s container.* minecraft:chainmail_helmet[minecraft:custom_data~{item:"gas_mask"}] run tag @s add has_gas_mask
execute as @a[tag=ie.active,tag=!state.dead] if items entity @s container.* minecraft:leather_helmet[minecraft:custom_data~{item:"gas_mask"}] run tag @s add has_gas_mask

execute as @a[tag=ie.active,tag=team.human,tag=!state.infected_period,scores={spore_load=50..}] at @s run function escape_island:infection/spore_load_warn

execute as @a[tag=ie.active,tag=state.sporifying] at @s run function escape_island:infection/sporify_tick
function escape_island:infection/respawn_tick

execute as @a[tag=ie.active,tag=infected.mother,tag=state.hunting,tag=!state.dead,scores={cd_mother_lunge=..0}] if score @s used_firework > @s used_firework_last run function skill:mother/lunge
execute as @a[tag=ie.active,tag=infected.mother] run scoreboard players operation @s used_firework_last = @s used_firework

execute as @a[tag=ie.active,tag=infected.mother] at @s run function escape_island:role/tick_mother
execute as @a[tag=ie.active,tag=role.doctor] at @s run function escape_island:role/tick_doctor
execute as @a[tag=ie.active,tag=role.captain] at @s run function escape_island:role/tick_captain
execute as @a[tag=ie.active,tag=role.engineer] at @s run function escape_island:role/tick_engineer
execute as @a[tag=ie.active,tag=role.marine] at @s run function escape_island:role/tick_marine
execute as @a[tag=ie.active,tag=role.chef] at @s run function escape_island:role/tick_chef
execute as @a[tag=ie.active,tag=role.radio] at @s run function escape_island:role/tick_radio
execute as @a[tag=ie.active,tag=role.virologist] at @s run function escape_island:role/tick_virologist
execute as @a[tag=ie.active,tag=role.mechanic] at @s run function escape_island:role/tick_mechanic
execute as @a[tag=ie.active,tag=role.athlete] at @s run function escape_island:role/tick_athlete
execute as @a[tag=ie.active,tag=role.priest] at @s run function escape_island:role/tick_priest
