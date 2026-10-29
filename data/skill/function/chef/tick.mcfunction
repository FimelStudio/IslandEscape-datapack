function skill:chef/hot_soup/tick
execute if score $tick ie.hygiene matches 0 as @a[tag=ie.active,tag=!role.chef] run function skill:chef/cleanup_non_chef
