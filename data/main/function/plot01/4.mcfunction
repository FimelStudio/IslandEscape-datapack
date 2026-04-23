tellraw @a [\
    {text:"丁真珠太郎",color:"#B4684D"},\
    {text:": 你可以叫我小马。",color:"white"}]
#title @a actionbar [\
    {text:"丁真珠太郎",color:"#B4684D"},\
    {text:": 你可以叫我小马。",color:"white"}]

execute as @e[tag=dingzhen] at @s run playsound rpg:plot01.4 player @a ~ ~ ~ 1 1 1

scoreboard players add @e[type=mannequin,tag=dingzhen,limit=1] TalkAction 1