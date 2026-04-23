data modify entity @s text set value {selector:"@a[tag=eated_zombie,limit=1]"}
data modify storage zombie:eated player_name set from entity @s text.text
kill @s