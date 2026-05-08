scoreboard objectives add skill.rifle_mag dummy
scoreboard objectives add skill.rifle_fire_cd dummy
scoreboard objectives add skill.rifle_reload dummy
scoreboard objectives add skill.rifle_tmp dummy

advancement revoke @a only skill:weapon/rifle/use
scoreboard players set @a skill.rifle_mag 30
scoreboard players set @a skill.rifle_fire_cd 0
scoreboard players set @a skill.rifle_reload 0
scoreboard players set #ammo skill.rifle_tmp 0
tag @a remove skill.rifle.reloading
