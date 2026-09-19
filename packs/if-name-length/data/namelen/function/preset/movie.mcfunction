# 撮影用。短い名前でも画が持つように倍率を上げる
scoreboard players set #mult namelen.cfg 3
scoreboard players set #actionbar namelen.cfg 1
scoreboard players set #fx namelen.cfg 1
tellraw @a ["",{"text":"[文字数] ","color":"gold"},{"text":"movie（倍率 3）","color":"white"}]
