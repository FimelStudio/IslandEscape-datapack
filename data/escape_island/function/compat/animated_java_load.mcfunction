# Animated Java 导出入口存在无条件自调用；用兼容层初始化，避免耗尽命令预算。
# 保留生成目录原样，重新导出模型后可单独重新核对该适配层。
scoreboard objectives add aj.i dummy
scoreboard objectives add aj.id dummy
scoreboard objectives add aj.is_rig_loaded dummy
scoreboard objectives add aj.tween_duration dummy
scoreboard players add aj.last_id aj.id 0
function animated_java:global/gu/on_load
function animated_java:helicopter/on_load
