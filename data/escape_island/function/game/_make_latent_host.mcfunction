# escape_island:game/_make_latent_host  —  run as the chosen player
# Stays in survivors team, no mother skills, no infection ability yet.

tag @s add role.latent_host

# Vague private hint at T+2:00 — no explicit reveal
tellraw @s {"text":"你感到一阵莫名的寒意……","color":"gray","italic":true}
