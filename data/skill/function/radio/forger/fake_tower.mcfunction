scoreboard players operation $forger signal_forger_show = $game signal_progress
scoreboard players add $forger signal_forger_show 25
execute if score $forger signal_forger_show > Tunable tunable.signal_global_target run scoreboard players operation $forger signal_forger_show = Tunable tunable.signal_global_target

tellraw @a[tag=team.human] [{"text":"[信号塔] 一座信号塔上线！网络进度: ","color":"green"},{"score":{"name":"$forger","objective":"signal_forger_show"}},{"text":"/","color":"green"},{"score":{"name":"Tunable","objective":"tunable.signal_global_target"},"color":"green"}]
playsound minecraft:block.beacon.activate master @a[tag=team.human] ~ ~ ~ 1 0.8
tellraw @s {"text":"[信号欺骗] 虚假塔位完成通报已发出。","color":"dark_purple"}
