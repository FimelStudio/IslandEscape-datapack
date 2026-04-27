summon minecraft:armor_stand ~ ~3 ~ {Tags:["entity.helicopter"],NoGravity:1b,CustomName:{"text":"直升机","color":"gold"},CustomNameVisible:1b}
tellraw @a [{"text":"§6降落坐标: "},{"selector":"@e[tag=entity.helicopter,limit=1]"}]
