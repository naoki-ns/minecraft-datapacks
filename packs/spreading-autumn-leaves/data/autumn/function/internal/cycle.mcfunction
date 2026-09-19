# #interval tick ごとに1回だけ走る
scoreboard players set #timer autumn.config 0

# /trigger autumn.toggle の受付（使うたびに再許可が要るのでここでまとめて）
scoreboard players enable @a autumn.toggle
execute as @a[scores={autumn.toggle=1..}] run function autumn:internal/toggle

# 本体。プレイヤーの周りだけを見る
execute if score #enabled autumn.config matches 1 as @a at @s run function autumn:internal/run_samples
