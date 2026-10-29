
execute unless entity @a[tag=role.doctor] as @a[tag=state.role_candidate,tag=!infected.mother,sort=random,limit=1] run function escape_island:role/_tag_doctor
execute as @a[tag=state.role_candidate,tag=!infected.mother,sort=random,limit=1] run function escape_island:role/_tag_captain
execute as @a[tag=state.role_candidate,tag=!infected.mother,sort=random,limit=1] run function escape_island:role/_tag_engineer
execute as @a[tag=state.role_candidate,tag=!infected.mother,sort=random,limit=1] run function escape_island:role/_tag_marine
execute as @a[tag=state.role_candidate,tag=!infected.mother,sort=random,limit=1] run function escape_island:role/_tag_chef
execute as @a[tag=state.role_candidate,tag=!infected.mother,sort=random,limit=1] run function escape_island:role/_tag_radio
execute as @a[tag=state.role_candidate,tag=!infected.mother,sort=random,limit=1] run function escape_island:role/_tag_virologist
execute as @a[tag=state.role_candidate,tag=!infected.mother,sort=random,limit=1] run function escape_island:role/_tag_mechanic
execute as @a[tag=state.role_candidate,tag=!infected.mother,sort=random,limit=1] run function escape_island:role/_tag_athlete
execute as @a[tag=state.role_candidate,tag=!infected.mother,sort=random,limit=1] run function escape_island:role/_tag_priest

# 候选者超过职业种类时继续下一轮，允许职业重复但每名玩家只分配一次。
execute if entity @a[tag=state.role_candidate,tag=!infected.mother,limit=1] run function escape_island:role/_assign_remaining
