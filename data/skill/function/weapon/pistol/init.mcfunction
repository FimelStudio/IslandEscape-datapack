scoreboard objectives add skill.pistol_mag dummy
scoreboard objectives add skill.pistol_fire_cd dummy
scoreboard objectives add skill.pistol_reload dummy
scoreboard objectives add skill.pistol_reload_sec dummy
scoreboard objectives add skill.pistol_tmp dummy
scoreboard objectives add skill.pistol_swap dummy

advancement revoke @a only skill:weapon/pistol/use
scoreboard players set @a skill.pistol_fire_cd 0
scoreboard players set @a skill.pistol_reload 0
scoreboard players set @a skill.pistol_reload_sec 0
scoreboard players set @a skill.pistol_swap 0
scoreboard players set #hit skill.pistol_tmp 0
scoreboard players set #ammo skill.pistol_tmp 0
scoreboard players set #loaded skill.pistol_tmp 0
scoreboard players set #before skill.pistol_tmp 0
scoreboard players set #twenty skill.pistol_tmp 20
scoreboard players set #reload_round skill.pistol_tmp 19
