# 毎 tick 走るのはこの2行だけ

scoreboard players add #timer namelen.cfg 1
execute if score #timer namelen.cfg >= #interval namelen.cfg run function namelen:internal/cycle
