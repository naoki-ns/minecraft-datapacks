# #interval tick ごとに1回

scoreboard players set #timer namelen.cfg 0

# /trigger namelen.toggle の受付
scoreboard players enable @a namelen.toggle
execute as @a[scores={namelen.toggle=1..}] run function namelen:internal/toggle

execute if score #enabled namelen.cfg matches 1 as @a at @s run function namelen:internal/update
