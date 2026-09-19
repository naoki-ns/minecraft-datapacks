# 文字数が多いほど派手にする。ここを盛るとショートの締まりが変わる。

# 1〜4文字: しょぼい
execute if score @s namelen.len matches ..4 at @s anchored eyes positioned ^ ^ ^1.5 run particle minecraft:smoke ~ ~ ~ 0.1 0.1 0.1 0 4
execute if score @s namelen.len matches ..4 at @s run playsound minecraft:entity.player.attack.weak player @a ~ ~ ~ 0.8 1.4

# 5〜9文字: バニラのまま（無演出）

# 10〜19文字: 効いてる音
execute if score @s namelen.len matches 10..19 at @s anchored eyes positioned ^ ^ ^1.5 run particle minecraft:crit ~ ~ ~ 0.4 0.4 0.4 0.2 30
execute if score @s namelen.len matches 10..19 at @s run playsound minecraft:entity.player.attack.crit player @a ~ ~ ~ 1 0.8

# 20文字以上: オチ用
execute if score @s namelen.len matches 20.. at @s anchored eyes positioned ^ ^ ^2 run particle minecraft:flash ~ ~ ~ 0 0 0 0 1
execute if score @s namelen.len matches 20.. at @s anchored eyes positioned ^ ^ ^2 run particle minecraft:explosion ~ ~ ~ 0.5 0.5 0.5 0 6
execute if score @s namelen.len matches 20.. at @s run playsound minecraft:entity.lightning_bolt.thunder player @a ~ ~ ~ 0.7 1.2
