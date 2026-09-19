# 毎 tick 走る唯一の処理。ここは常に2コマンドだけに保つ。
scoreboard players add #timer autumn.config 1
execute if score #timer autumn.config >= #interval autumn.config run function autumn:internal/cycle
