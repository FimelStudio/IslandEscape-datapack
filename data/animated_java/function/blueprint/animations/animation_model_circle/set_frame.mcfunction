# 此文件由动画模型工具生成，不建议手动编辑。
data remove storage animated_java:temp args
$execute store result storage animated_java:temp args.frame int 1 run scoreboard players set @s aj.animation_model_circle.frame $(frame)
execute at @s run function animated_java:blueprint/animations/animation_model_circle/zzz/set_frame with storage animated_java:temp args
