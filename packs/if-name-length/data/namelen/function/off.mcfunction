scoreboard players set #enabled namelen.cfg 0

# 攻撃力をバニラの初期値に戻す
attribute @a minecraft:attack_damage base set 1
title @a actionbar ""

tellraw @a ["",{"text":"[文字数] ","color":"gold"},{"text":"OFF","color":"red"},{"text":" — 攻撃力をバニラに戻しました","color":"gray"}]
