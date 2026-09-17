# 初期化（データパック読み込み時に自動実行）
scoreboard objectives add autumn.config dummy
scoreboard objectives add autumn.tmp dummy
scoreboard objectives add autumn.toggle trigger "紅葉の伝播 ON/OFF"

# ON/OFF は /reload をまたいで保持する（未設定のときだけ ON にする）
execute unless score #enabled autumn.config matches 0..1 run scoreboard players set #enabled autumn.config 1
scoreboard players set #timer autumn.config 0

function autumn:config

scoreboard players enable @a autumn.toggle
tellraw @a ["",{"text":"[紅葉] ","color":"gold","bold":true},{"text":"Spreading Autumn Leaves を読み込みました  ","color":"gray"},{"text":"[/function autumn:status]","color":"yellow","click_event":{"action":"run_command","command":"/function autumn:status"}}]
