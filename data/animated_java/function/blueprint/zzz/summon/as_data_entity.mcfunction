# 此文件由动画模型工具生成，不建议手动编辑。
data modify entity @s data.uuids append from storage animated_java:gu out
function animated_java:global/gu/get_entity_uuid_string
data modify entity @s data.uuids append from storage animated_java:gu out
data modify entity @s data.uuids_by_name.data_data set from storage animated_java:gu out
execute on vehicle on passengers if entity @s[tag=aj.blueprint.node.voxel_file] run function animated_java:global/gu/get_entity_uuid_string
data modify entity @s data.uuids append from storage animated_java:gu out
data modify entity @s data.uuids_by_name.bone_voxel_file set from storage animated_java:gu out
