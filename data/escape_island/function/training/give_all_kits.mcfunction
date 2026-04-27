tag @s add role.survivor
tag @s add role.doctor
tag @s add role.captain
tag @s add role.engineer
tag @s add role.marine
tag @s add role.chef
tag @s add role.radio
tag @s add role.virologist
tag @s add role.mechanic
tag @s add role.sailor
tag @s add role.priest
tag @s add flag.cross_intact

function escape_island:role/_give_base_survivor
function escape_island:role/kit_doctor
function escape_island:role/kit_captain
function escape_island:role/kit_engineer
function escape_island:role/kit_marine
function escape_island:role/kit_chef
function escape_island:role/kit_radio
function escape_island:role/kit_virologist
function escape_island:role/kit_mechanic
function escape_island:role/kit_sailor
function escape_island:role/kit_priest

tellraw @s [{"text":"所有职业套件已给予。","color":"green"},{"text":" [退出训练]","color":"gray","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:training/reset"}},{"text":" [刷测试人偶]","color":"red","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:test/spawn_dummies"}}]
