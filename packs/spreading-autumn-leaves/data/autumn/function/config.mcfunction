#=============================================================================
#  紅葉が広がる / Spreading Autumn Leaves
#  ★ 調整するのはこのファイルだけ ★
#  編集したら:  /reload  ->  /function autumn:config
#=============================================================================

# --- 処理間隔（tick）---------------------------------------------------------
#  何 tick ごとに1サイクル回すか。20 = 1秒。小さいほど速く広がり、重くなる。
scoreboard players set #interval autumn.config 5

# --- 1サイクル・1プレイヤーあたりのサンプル数 ---------------------------------
#  ランダムに何ブロック調べるか。大きいほど速く広がり、重くなる。
scoreboard players set #samples autumn.config 48

# --- 変化確率（%）------------------------------------------------------------
#  「ポプラの葉に隣接する普通の葉」1ブロックあたりの、1回の判定での変化確率。
scoreboard players set #chance autumn.config 30

# --- 色の引き継ぎ率（%）------------------------------------------------------
#  伝播元と同じ色を継ぐ確率。高いほど同系色が固まり、実際の紅葉らしい斑になる。
#  0 にすると1ブロックごとに完全ランダム（チカチカした見た目）。
scoreboard players set #inherit autumn.config 80

# --- 探索範囲（プレイヤーからのブロック数）-----------------------------------
#  XZ は水平半径、Y は上下の高さ。狭いほど密度が上がって体感が速くなる。
data modify storage autumn:config radius_xz set value 24
data modify storage autumn:config radius_y set value 16

# --- 置き換えに使うポプラの葉ブロック ----------------------------------------
#  赤・橙・黄の3色。ここを直せば使う色を変えられる。
#  ※検出側の data/autumn/tags/block/poplar_leaves.json と、
#    演出側の internal/effects.mcfunction のパーティクルも合わせること。
data modify storage autumn:config colors set value {a: "minecraft:red_poplar_leaves", b: "minecraft:orange_poplar_leaves", c: "minecraft:yellow_poplar_leaves"}

# --- 演出 --------------------------------------------------------------------
#  パーティクルと音は data/autumn/function/internal/effects.mcfunction にあります。
