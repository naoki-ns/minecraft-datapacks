# 攻撃力 = 文字数 × 文字数 × #mult （#min 〜 #cap でクランプ）

scoreboard players operation #dmg namelen.tmp = #len namelen.tmp
scoreboard players operation #dmg namelen.tmp *= #len namelen.tmp
scoreboard players operation #dmg namelen.tmp *= #mult namelen.cfg
execute if score #dmg namelen.tmp < #min namelen.cfg run scoreboard players operation #dmg namelen.tmp = #min namelen.cfg
execute if score #dmg namelen.tmp > #cap namelen.cfg run scoreboard players operation #dmg namelen.tmp = #cap namelen.cfg

scoreboard players operation @s namelen.dmg = #dmg namelen.tmp
execute store result storage namelen:tmp dmg int 1 run scoreboard players get #dmg namelen.tmp
function namelen:internal/set_attack with storage namelen:tmp

execute if score #actionbar namelen.cfg matches 1 run function namelen:internal/actionbar
