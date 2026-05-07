function skill:weapon/ak47/reload_load_one
execute if score #loaded skill.ak47_tmp matches 1.. if score @s skill.ak47_mag matches ..29 run function skill:weapon/ak47/reload_load_all
