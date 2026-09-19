# プレイヤー1人分。持ち物の名前の文字数を出して攻撃力に変える。

scoreboard players set #len namelen.tmp 0
function namelen:internal/pick_item

# 1) 金床で付けた名前があれば、それをそのまま数える（この動画のオチはここ）
execute if data storage namelen:tmp item.components."minecraft:custom_name" store result score #len namelen.tmp run data get storage namelen:tmp item.components."minecraft:custom_name"
execute if score #len namelen.tmp matches 1.. run scoreboard players operation #len namelen.tmp -= #name_overhead namelen.cfg

# 2) 名前が付いていなければ、バニラ名の文字数テーブルを引く
execute if score #len namelen.tmp matches ..0 if data storage namelen:tmp item.id run function namelen:internal/lookup with storage namelen:tmp item

# 3) 素手・未登録は既定値
execute if score #len namelen.tmp matches ..0 run scoreboard players operation #len namelen.tmp = #default namelen.cfg
execute if score #len namelen.tmp matches ..0 run scoreboard players set #len namelen.tmp 0

scoreboard players operation @s namelen.len = #len namelen.tmp
function namelen:internal/apply
