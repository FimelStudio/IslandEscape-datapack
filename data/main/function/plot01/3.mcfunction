tellraw @a [\
    {text:"丁真珠太郎",color:"#B4684D"},\
    {text:": 私の名は丁真珠太郎です。",color:"white"}]

#title @a actionbar [\
    {text:"丁真珠太郎",color:"#B4684D"},\
    {text:": 私の名は丁真珠太郎です。",color:"white"}]
    
execute as @e[tag=dingzhen] at @s run playsound rpg:plot01.3 player @a ~ ~ ~ 1 1 1

scoreboard players add @e[type=mannequin,tag=dingzhen,limit=1] TalkAction 3

schedule function main:plot01/4 3.5s