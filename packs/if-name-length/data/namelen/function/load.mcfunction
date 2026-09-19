# 初期化

scoreboard objectives add namelen.cfg dummy
scoreboard objectives add namelen.tmp dummy
scoreboard objectives add namelen.len dummy "文字数"
scoreboard objectives add namelen.dmg dummy "攻撃力"
scoreboard objectives add namelen.toggle trigger

function namelen:config
function namelen:table

# ON/OFF は /reload をまたいで保持する（初回のみ ON）
execute unless score #enabled namelen.cfg matches 0..1 run scoreboard players set #enabled namelen.cfg 1

scoreboard players enable @a namelen.toggle

tellraw @a ["",{"text":"[文字数] ","color":"gold"},{"text":"Name Length Is Power を読み込みました。","color":"white"}]
tellraw @a ["",{"text":"        この世界では ","color":"gray"},{"text":"持ち物の名前の文字数","color":"yellow"},{"text":" がそのまま攻撃力です。","color":"gray"}]
tellraw @a ["",{"text":"        /function namelen:status で現在の設定を表示","color":"dark_gray"}]
