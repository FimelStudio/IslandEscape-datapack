# 神父被动: 持有十字架时监听致死/感染期 (由 advancement 触发, 不需 tick)
# T+3:00 私聊提示 (phase_timer = 3600)
execute if score $game phase_timer matches 3600 run tellraw @s {"text":"你看到铭牌下方有一行被划掉的内容……","color":"gray","italic":true}
