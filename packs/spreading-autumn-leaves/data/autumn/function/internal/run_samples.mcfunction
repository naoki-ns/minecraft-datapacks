# プレイヤー1人ぶんのサンプリング開始（実行位置 = そのプレイヤー）
scoreboard players operation #left autumn.tmp = #samples autumn.config
execute if score #left autumn.tmp matches 1.. run function autumn:internal/sample_loop
