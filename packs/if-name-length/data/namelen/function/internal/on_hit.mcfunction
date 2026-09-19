# 殴った瞬間（advancement namelen:hit の報酬）

advancement revoke @s only namelen:hit
execute if score #enabled namelen.cfg matches 1 if score #fx namelen.cfg matches 1 run function namelen:internal/fx
