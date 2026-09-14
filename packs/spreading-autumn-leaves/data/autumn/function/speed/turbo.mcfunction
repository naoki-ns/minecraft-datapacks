# タイムラプス用。範囲を絞って一気に染める。長時間の常用は非推奨
scoreboard players set #interval autumn.config 1
scoreboard players set #samples autumn.config 160
scoreboard players set #chance autumn.config 100
data modify storage autumn:config radius_xz set value 16
data modify storage autumn:config radius_y set value 10
tellraw @a ["",{"text":"[紅葉] ","color":"gold","bold":true},{"text":"速度: turbo","color":"red"}]
