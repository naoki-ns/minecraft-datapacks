# 撮影用。数分で目に見えて広がる
scoreboard players set #interval autumn.config 2
scoreboard players set #samples autumn.config 96
scoreboard players set #chance autumn.config 60
data modify storage autumn:config radius_xz set value 20
data modify storage autumn:config radius_y set value 12
tellraw @a ["",{"text":"[紅葉] ","color":"gold","bold":true},{"text":"速度: fast","color":"yellow"}]
