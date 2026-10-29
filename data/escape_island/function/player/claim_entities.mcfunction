# @s 为创建者；本次同步生成的实体带 ie.new，函数返回前完成归属。
function escape_island:player/ensure_actor_id
scoreboard players operation $owner ie.actor = @s ie.actor
execute as @e[tag=ie.new] run scoreboard players operation @s ie.owner = $owner ie.actor
scoreboard players operation @e[tag=ie.new] ie.session = $game ie.match_id
tag @e[tag=ie.new] add ie.owned
tag @e[tag=ie.new] remove ie.new
