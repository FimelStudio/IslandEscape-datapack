# 此文件由动画模型工具生成，不建议手动编辑。
tag @s add aj.transforms_only
$execute store success score #success aj.i run function animated_java:blueprint/animations/$(animation)/zzz/set_frame with storage animated_java:temp args
tag @s remove aj.transforms_only
execute if score #success aj.i matches 1 run return 1
return fail
