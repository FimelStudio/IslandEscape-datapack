execute as @a[tag=!sliding] as @s at @s if predicate skill:is_slide run function skill:slide_tackle/slide_1

execute as @a[tag=sliding] as @s at @s if predicate skill:is_space run function skill:slide_tackle/slide_2
execute as @a[tag=sliding] as @s at @s if predicate skill:is_sneak run function skill:slide_tackle/slide_2

