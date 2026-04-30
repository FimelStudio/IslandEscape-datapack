function skill:chef/hot_soup/tick
execute as @a[tag=!role.chef] run function skill:chef/cleanup_non_chef
