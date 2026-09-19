# 変化した瞬間の演出。見た目・音を変えたいときはこのファイルだけ触ればよい。
#
# パーティクルは 26.3 のポプラ専用の落葉パーティクル。染まった色に合わせて出し分ける。
# （minecraft:red_poplar_leaves / orange_poplar_leaves / yellow_poplar_leaves）
execute if score #color autumn.tmp matches 1 run particle minecraft:red_poplar_leaves ~0.5 ~0.5 ~0.5 0.4 0.3 0.4 0 6 force @a[distance=..48]
execute if score #color autumn.tmp matches 2 run particle minecraft:orange_poplar_leaves ~0.5 ~0.5 ~0.5 0.4 0.3 0.4 0 6 force @a[distance=..48]
execute if score #color autumn.tmp matches 3 run particle minecraft:yellow_poplar_leaves ~0.5 ~0.5 ~0.5 0.4 0.3 0.4 0 6 force @a[distance=..48]

# 音は毎回鳴らすとうるさいので 1/4 の確率だけ。音量 0.25 の控えめ設定。
# 候補: minecraft:block.poplar_leaves.place / .break / minecraft:block.grass.break
execute store result score #snd autumn.tmp run random value 1..4
execute if score #snd autumn.tmp matches 1 run playsound minecraft:block.poplar_leaves.place blocks @a[distance=..24] ~ ~ ~ 0.25 1.2
