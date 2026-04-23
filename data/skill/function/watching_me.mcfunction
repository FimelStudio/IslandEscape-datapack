#execute as @e[type=mannequin,tag=dingzhen,limit=1] if score @s TalkAction matches 0 run rotate @s facing entity @a[tag=rpg,limit=1,sort=nearest] feet
#execute as @e[type=mannequin,tag=xiaochuan,limit=1] if score @s TalkAction matches 0 run rotate @s facing entity @a[tag=rpg,limit=1,sort=nearest] feet

give @a minecraft:chainmail_helmet[minecraft:item_model="ie:red_head"] 1 

give @a minecraft:cake[minecraft:item_model="ie:hat"] 1 
