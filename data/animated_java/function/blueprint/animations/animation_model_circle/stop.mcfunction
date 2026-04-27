# 此文件由动画模型工具生成，不建议手动编辑。
function animated_java:blueprint/animations/pause_all
scoreboard players set @s aj.animation_model_circle.frame 0
tag @s add aj.transforms_only
execute at @s run function animated_java:blueprint/animations/animation_model_circle/zzz/set_frame {frame: 0}
tag @s remove aj.transforms_only
