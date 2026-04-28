advancement revoke @s only skill:mother/eat/release_entity
execute unless entity @s[tag=role.mother,tag=mother_eating] run return 0
execute unless entity @a[tag=eaten_zombie,limit=1] run function skill:mother/eat/reset_state
execute unless entity @a[tag=eaten_zombie,limit=1] run return 0

function skill:mother/eat/config
execute as @a[tag=eaten_zombie,limit=1] at @s run spectate
execute as @a[tag=eaten_zombie,limit=1] at @s run gamemode survival @s
execute as @a[tag=eaten_zombie,limit=1] at @a[tag=mother_eating,limit=1] rotated as @a[tag=mother_eating,limit=1] run tp @s ^ ^0.2 ^1.2
execute as @a[tag=eaten_zombie,limit=1] at @s rotated as @a[tag=mother_eating,limit=1] run function skill:mother/eat/apply_release_motion
execute at @a[tag=eaten_zombie,limit=1] run function skill:mother/eat/release_common
