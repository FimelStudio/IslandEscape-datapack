# 此文件由动画模型工具生成，不建议手动编辑。
$execute on passengers if entity @s[tag=aj.global.data] run function animated_java:blueprint/animations/animation_model_circle/zzz/frames/$(frame) with entity @s data.uuids_by_name
execute on passengers if entity @s[tag=!aj.global.data] run data modify entity @s start_interpolation set value -1
return 1
