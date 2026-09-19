# /trigger autumn.toggle で ON/OFF を反転（実行者 = @s）
scoreboard players reset @s autumn.toggle
scoreboard players enable @s autumn.toggle
scoreboard players operation #was autumn.tmp = #enabled autumn.config
execute if score #was autumn.tmp matches 1 run function autumn:off
execute unless score #was autumn.tmp matches 1 run function autumn:on
