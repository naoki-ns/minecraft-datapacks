# /trigger namelen.toggle で ON/OFF を反転

scoreboard players set @s namelen.toggle 0
scoreboard players operation #was namelen.tmp = #enabled namelen.cfg
execute if score #was namelen.tmp matches 1 run function namelen:off
execute if score #was namelen.tmp matches 0 run function namelen:on
