# 此文件由动画模型工具生成，不建议手动编辑。
execute unless entity @s[tag=aj.blueprint.root] run return 0
execute if entity @s[tag=aj.blueprint.animation.animation_model_circle.playing] run function animated_java:blueprint/animations/animation_model_circle/zzz/on_tick
execute on passengers run rotate @s ~ ~
