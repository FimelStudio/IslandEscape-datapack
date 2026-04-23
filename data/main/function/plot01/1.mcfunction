tellraw @a [\
    {text:"丁真珠太郎",color:"#B4684D"},\
    {text:": 兄弟…",color:"white"}]

execute as @e[tag=dingzhen] at @s run playsound rpg:plot01.1 player @a ~ ~ ~ 1 1 1

schedule function main:plot01/2 2s