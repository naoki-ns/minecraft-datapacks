# オチ用: 金床で名前を付けた長い名前の棒を配る（27文字 = 攻撃力 729）
# エンダードラゴンは体力 200 なのでワンパンできる。

give @s minecraft:stick[minecraft:custom_name='{"text":"この棒は金床で世界一長い名前を付けられた伝説の棒である"}']
tellraw @s ["",{"text":"[文字数] ","color":"gold"},{"text":"27文字の棒を渡しました（攻撃力 729）","color":"white"}]
