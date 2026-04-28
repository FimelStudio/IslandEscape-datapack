function skill:mother/eat/config
execute unless entity @s[tag=role.mother,tag=mother_eating] run scoreboard players reset @s ie.eat_health
execute unless entity @s[tag=role.mother,tag=mother_eating] run return 0
execute unless entity @a[tag=eaten_zombie,limit=1] run scoreboard players reset @s ie.eat_health
execute unless entity @a[tag=eaten_zombie,limit=1] run return 0

scoreboard players operation #health skill.mother_eat = @s ie.eat_health
scoreboard players reset @s ie.eat_health
function skill:mother/eat/apply_config_value
