advancement revoke @s only skill:common/cryo_medkit
execute unless entity @s[tag=state.infected_period] run give @s minecraft:golden_apple[minecraft:custom_data={item:"medkit_cold"},minecraft:custom_name={"text":"急救冷藏箱","color":"aqua","bold":true,"italic":false},minecraft:consumable={animation:"spyglass",consume_seconds:0,has_consume_particles:false,sound:{sound_id:""}},minecraft:lore=[{"text":"右键使用→清除感染期","color":"gray","italic":false}]] 1
execute unless entity @s[tag=state.infected_period] run tellraw @s {"text":"§c你未处于感染期，冷藏箱已退还","color":"red"}
execute unless entity @s[tag=state.infected_period] run return 0
function escape_island:infection/cure
