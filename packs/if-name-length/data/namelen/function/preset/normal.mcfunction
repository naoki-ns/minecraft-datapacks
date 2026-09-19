# 通常。攻撃力 = 文字数の2乗
scoreboard players set #mult namelen.cfg 1
scoreboard players set #actionbar namelen.cfg 1
scoreboard players set #fx namelen.cfg 1
tellraw @a ["",{"text":"[文字数] ","color":"gold"},{"text":"normal（倍率 1）","color":"white"}]
