# カスタムネームの文字数がズレていないか確かめる（撮影前に1回やる）
#
# 金床で名前を付けたアイテムを持って実行する。
# 「生の値」が実際の文字数より大きいときは、その差を config の
# #name_overhead に入れて /reload -> /function namelen:config。

function namelen:internal/pick_item

scoreboard players set #raw namelen.tmp 0
execute if data storage namelen:tmp item.components."minecraft:custom_name" store result score #raw namelen.tmp run data get storage namelen:tmp item.components."minecraft:custom_name"

tellraw @s ["",{"text":"――― probe ―――","color":"gold"}]
execute unless data storage namelen:tmp item run tellraw @s ["",{"text":"手に何も持っていません","color":"red"}]
execute if data storage namelen:tmp item unless data storage namelen:tmp item.components."minecraft:custom_name" run tellraw @s ["",{"text":"カスタムネームなし（テーブル参照になります）","color":"gray"}]
tellraw @s ["",{"text":"生の値: ","color":"gray"},{"score":{"name":"#raw","objective":"namelen.tmp"},"color":"white"},{"text":"   現在の補正 #name_overhead: ","color":"gray"},{"score":{"name":"#name_overhead","objective":"namelen.cfg"},"color":"white"}]
tellraw @s ["",{"text":"適用中: ","color":"gray"},{"score":{"name":"*","objective":"namelen.len"},"color":"yellow"},{"text":"文字  →  攻撃力 ","color":"gray"},{"score":{"name":"*","objective":"namelen.dmg"},"color":"red"}]
tellraw @s ["",{"text":"「生の値」が見た目の文字数より多いなら、その差を #name_overhead へ","color":"dark_gray"}]
