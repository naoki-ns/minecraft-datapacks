# ポプラの葉の位置で実行される。マクロ引数は storage autumn:config colors
#
# まず伝播元の色を覚える。convert 側でこの色を引き継ぐことで、
# 同系色がまとまった斑（まだら）になり、実際の紅葉らしい見た目になる。
scoreboard players set #src_color autumn.tmp 0
$execute if block ~ ~ ~ $(a) run scoreboard players set #src_color autumn.tmp 1
$execute if block ~ ~ ~ $(b) run scoreboard players set #src_color autumn.tmp 2
$execute if block ~ ~ ~ $(c) run scoreboard players set #src_color autumn.tmp 3

# 6近傍へ伝播を試す
execute positioned ~1 ~ ~ run function autumn:internal/try_convert
execute positioned ~-1 ~ ~ run function autumn:internal/try_convert
execute positioned ~ ~1 ~ run function autumn:internal/try_convert
execute positioned ~ ~-1 ~ run function autumn:internal/try_convert
execute positioned ~ ~ ~1 run function autumn:internal/try_convert
execute positioned ~ ~ ~-1 run function autumn:internal/try_convert
