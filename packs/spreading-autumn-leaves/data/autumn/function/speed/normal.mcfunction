# 通常。放置して少しずつ広がる速さ
scoreboard players set #interval autumn.config 5
scoreboard players set #samples autumn.config 48
scoreboard players set #chance autumn.config 30
data modify storage autumn:config radius_xz set value 24
data modify storage autumn:config radius_y set value 16
tellraw @a ["",{"text":"[紅葉] ","color":"gold","bold":true},{"text":"速度: normal","color":"aqua"}]
