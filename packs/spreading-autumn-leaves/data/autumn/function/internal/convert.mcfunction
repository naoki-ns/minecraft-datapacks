# 1ブロックを紅葉させる。実行位置 = 置き換える葉ブロック。
#
# 重要: setblock でブロックを置き直すと blockstate が既定値に戻る。
#       葉は distance / persistent で自然消滅が決まるので、
#       元の値をそのまま引き継がないとバニラ挙動（葉の消滅）を壊す。
#       ここで元の状態を読み取ってから置き直している。
data modify storage autumn:tmp leaf set value {block: "minecraft:oak_leaves", distance: "7", persistent: "false", waterlogged: "false"}
execute if block ~ ~ ~ #autumn:spreadable_leaves[distance=1] run data modify storage autumn:tmp leaf.distance set value "1"
execute if block ~ ~ ~ #autumn:spreadable_leaves[distance=2] run data modify storage autumn:tmp leaf.distance set value "2"
execute if block ~ ~ ~ #autumn:spreadable_leaves[distance=3] run data modify storage autumn:tmp leaf.distance set value "3"
execute if block ~ ~ ~ #autumn:spreadable_leaves[distance=4] run data modify storage autumn:tmp leaf.distance set value "4"
execute if block ~ ~ ~ #autumn:spreadable_leaves[distance=5] run data modify storage autumn:tmp leaf.distance set value "5"
execute if block ~ ~ ~ #autumn:spreadable_leaves[distance=6] run data modify storage autumn:tmp leaf.distance set value "6"
execute if block ~ ~ ~ #autumn:spreadable_leaves[persistent=true] run data modify storage autumn:tmp leaf.persistent set value "true"
execute if block ~ ~ ~ #autumn:spreadable_leaves[waterlogged=true] run data modify storage autumn:tmp leaf.waterlogged set value "true"

# 色を決める。#inherit % の確率で伝播元と同じ色を継ぎ、外れたらランダムに選び直す
scoreboard players operation #color autumn.tmp = #src_color autumn.tmp
execute store result score #mix autumn.tmp run random value 1..100
execute if score #mix autumn.tmp > #inherit autumn.config run scoreboard players set #color autumn.tmp 0
execute if score #color autumn.tmp matches 0 store result score #color autumn.tmp run random value 1..3

execute if score #color autumn.tmp matches 1 run data modify storage autumn:tmp leaf.block set from storage autumn:config colors.a
execute if score #color autumn.tmp matches 2 run data modify storage autumn:tmp leaf.block set from storage autumn:config colors.b
execute if score #color autumn.tmp matches 3 run data modify storage autumn:tmp leaf.block set from storage autumn:config colors.c

function autumn:internal/place with storage autumn:tmp leaf
function autumn:internal/effects
