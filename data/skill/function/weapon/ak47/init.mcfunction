scoreboard objectives add skill.ak47_mag dummy
scoreboard objectives add skill.ak47_fire_cd dummy
scoreboard objectives add skill.ak47_reload dummy
scoreboard objectives add skill.ak47_reload_sec dummy
scoreboard objectives add skill.ak47_reload_cs dummy
scoreboard objectives add skill.ak47_reload_frac dummy
scoreboard objectives add skill.ak47_tmp dummy
scoreboard objectives add skill.ak47_swap dummy

advancement revoke @a only skill:weapon/ak47/use
scoreboard players set @a skill.ak47_fire_cd 0
scoreboard players set @a skill.ak47_reload 0
scoreboard players set @a skill.ak47_reload_sec 0
scoreboard players set @a skill.ak47_reload_cs 0
scoreboard players set @a skill.ak47_reload_frac 0
scoreboard players set @a skill.ak47_swap 0
scoreboard players set #hit skill.ak47_tmp 0
scoreboard players set #ammo skill.ak47_tmp 0
scoreboard players set #loaded skill.ak47_tmp 0
scoreboard players set #before skill.ak47_tmp 0
scoreboard players set #five skill.ak47_tmp 5
scoreboard players set #hundred skill.ak47_tmp 100
