# Pick a random heli_pad marker and summon helicopter entity there
execute at @r[tag=marker.heli_pad,sort=random,limit=1] run function escape_island:escape/_spawn_helicopter
