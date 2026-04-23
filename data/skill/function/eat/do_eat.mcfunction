

execute as @s unless predicate skill:facing_player run schedule function skill:eat/eat_0 1t

execute as @s if predicate skill:facing_player run schedule function skill:eat/eat_1 1t
