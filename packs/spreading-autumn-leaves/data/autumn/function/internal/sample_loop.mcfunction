function autumn:internal/sample with storage autumn:config
scoreboard players remove #left autumn.tmp 1
execute if score #left autumn.tmp matches 1.. run function autumn:internal/sample_loop
