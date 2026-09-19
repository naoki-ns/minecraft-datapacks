# 攻撃力（namelen.dmg）に応じて演出を変える。動画映えを最優先。
# 文字数ではなく攻撃力を基準にしているので、movie プリセット（#mult 3）だと
# 短い名前でも上のランクに届きやすくなる（＝短い名前でも画が持つ、という
# preset/movie の狙いがそのまま効く）。

# 〜15: しょぼい。煙だけのミス感
execute if score @s namelen.dmg matches ..15 at @s anchored eyes positioned ^ ^ ^1.2 run particle minecraft:smoke ~ ~ ~ 0.08 0.08 0.08 0 3
execute if score @s namelen.dmg matches ..15 at @s run playsound minecraft:entity.player.attack.weak player @a ~ ~ ~ 0.7 1.5

# 16〜63: 普通の一撃
execute if score @s namelen.dmg matches 16..63 at @s anchored eyes positioned ^ ^ ^1.5 run particle minecraft:crit ~ ~ ~ 0.3 0.3 0.3 0.15 16
execute if score @s namelen.dmg matches 16..63 at @s run playsound minecraft:entity.player.attack.strong player @a ~ ~ ~ 0.8 1

# 64〜195: 効いてる
execute if score @s namelen.dmg matches 64..195 at @s anchored eyes positioned ^ ^ ^1.5 run particle minecraft:crit ~ ~ ~ 0.4 0.4 0.4 0.25 40
execute if score @s namelen.dmg matches 64..195 at @s anchored eyes positioned ^ ^ ^1.5 run particle minecraft:sweep_attack ~ ~ ~ 0 0 0 0 1
execute if score @s namelen.dmg matches 64..195 at @s run playsound minecraft:entity.player.attack.crit player @a ~ ~ ~ 1 0.9

# 196〜399: かなり強い。画面に主張が出てくる
execute if score @s namelen.dmg matches 196..399 at @s anchored eyes positioned ^ ^ ^1.8 run particle minecraft:totem_of_undying ~ ~ ~ 0.5 0.5 0.5 0.3 30
execute if score @s namelen.dmg matches 196..399 at @s anchored eyes positioned ^ ^ ^1.8 run particle minecraft:end_rod ~ ~ ~ 0.4 0.4 0.4 0.1 20
execute if score @s namelen.dmg matches 196..399 at @s run playsound minecraft:entity.player.attack.crit player @a ~ ~ ~ 1 0.6
execute if score @s namelen.dmg matches 196..399 at @s run playsound minecraft:entity.ravager.stunned player @a ~ ~ ~ 0.4 1.6

# 400〜728: 大技。フラッシュ＋爆発
execute if score @s namelen.dmg matches 400..728 at @s anchored eyes positioned ^ ^ ^2 run particle minecraft:flash ~ ~ ~ 0 0 0 0 1
execute if score @s namelen.dmg matches 400..728 at @s anchored eyes positioned ^ ^ ^2 run particle minecraft:explosion ~ ~ ~ 0.5 0.5 0.5 0 6
execute if score @s namelen.dmg matches 400..728 at @s anchored eyes positioned ^ ^ ^2 run particle minecraft:end_rod ~ ~ ~ 0.6 0.6 0.6 0.2 40
execute if score @s namelen.dmg matches 400..728 at @s run playsound minecraft:entity.lightning_bolt.thunder player @a ~ ~ ~ 0.6 1.2

# 729〜: オチ専用（金床27文字の棒など）。全部乗せ
execute if score @s namelen.dmg matches 729.. at @s anchored eyes positioned ^ ^ ^2 run particle minecraft:flash ~ ~ ~ 0 0 0 0 1
execute if score @s namelen.dmg matches 729.. at @s anchored eyes positioned ^ ^ ^2 run particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 0 1
execute if score @s namelen.dmg matches 729.. at @s anchored eyes positioned ^ ^ ^2 run particle minecraft:end_rod ~ ~ ~ 1 1 1 0.4 80
execute if score @s namelen.dmg matches 729.. at @s anchored eyes positioned ^ ^ ^2 run particle minecraft:totem_of_undying ~ ~ ~ 1 1 1 0.5 60
execute if score @s namelen.dmg matches 729.. at @s run playsound minecraft:entity.lightning_bolt.thunder player @a ~ ~ ~ 1 0.9
execute if score @s namelen.dmg matches 729.. at @s run playsound minecraft:entity.wither.spawn player @a ~ ~ ~ 0.5 1.6
