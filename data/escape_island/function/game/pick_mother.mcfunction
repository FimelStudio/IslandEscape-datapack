# escape_island:game/pick_mother  —  silently select one survivor as the Mother
# No visible cue to other players — no sounds, no global messages, no particles.

execute as @r[tag=role.survivor] run function escape_island:game/_make_mother
