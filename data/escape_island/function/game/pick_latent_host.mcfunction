# escape_island:game/pick_latent_host  —  17–20 player games only
# Picks one non-Mother survivor as latent host. No immediate powers.

execute as @r[tag=role.survivor,tag=!role.mother] run function escape_island:game/_make_latent_host
