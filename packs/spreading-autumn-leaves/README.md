# 紅葉が広がる / Spreading Autumn Leaves

ポプラの葉が、隣り合う普通の葉ブロック（オーク・シラカバなど）を少しずつ
赤・橙・黄に染めていくデータパックです。放置するほど森全体が紅葉していきます。

対象: **Minecraft Java Edition 26.3**（`min_format` / `max_format` = `121.0`）

---

## 何が起きるか

- 一定間隔で、プレイヤーの周囲だけを見て「ポプラの葉」を探します
- 見つかったポプラの葉の**6近傍**にある普通の葉が、確率でポプラの葉に置き換わります
- 置き換わる色は**赤・橙・黄**。既定では 80% の確率で伝播元と同じ色を継ぐので、
  1ブロックずつチカチカせず、**同系色がまとまった斑**になります
- 変化した瞬間に、その色に合ったポプラの落葉パーティクルと控えめな音が出ます
- 染まった葉がまた次の葉を染めるので、森がじわじわ広がるように紅葉します

置き換えるときは元の葉ブロックの `distance` / `persistent` / `waterlogged` を
そのまま引き継ぐので、**葉の自然消滅などバニラの挙動は壊れません**。
（木を切れば紅葉した葉もちゃんと消えます）

使用しているバニラ ID（26.3）:

| 用途 | ID |
| --- | --- |
| ブロック | `minecraft:red_poplar_leaves` / `minecraft:orange_poplar_leaves` / `minecraft:yellow_poplar_leaves` |
| パーティクル | 同名の3種（引数なし） |
| 音 | `minecraft:block.poplar_leaves.place` |

---

## 導入

### 検証ワールドで使う（シンボリックリンク）

```sh
ln -s /path/to/minecraft-datapacks/packs/spreading-autumn-leaves \
      "/path/to/.minecraft/saves/<ワールド名>/datapacks/spreading-autumn-leaves"
```

ワールドに入って `/reload`。チャットに `[紅葉] Spreading Autumn Leaves を読み込みました`
と出れば成功です。読み込み時点で **ON** になっています。

### 配布用 zip を作る

```sh
./scripts/pack.sh spreading-autumn-leaves
# -> dist/spreading-autumn-leaves.zip
```

この zip をワールドの `datapacks/` に置くだけで動きます。

---

## コマンド

| コマンド | 内容 |
| --- | --- |
| `/function autumn:status` | 現在の設定を表示（速度切り替えボタン付き） |
| `/function autumn:on` | 伝播を開始 |
| `/function autumn:off` | 伝播を停止 |
| `/trigger autumn.toggle` | ON/OFF を反転（OP 権限なしで使える） |
| `/function autumn:speed/normal` | 通常速度 |
| `/function autumn:speed/fast` | 撮影用（数分で目に見えて広がる） |
| `/function autumn:speed/turbo` | タイムラプス用（範囲を絞って一気に染める） |
| `/function autumn:config` | `config.mcfunction` の設定を再適用 |

ON/OFF の状態は `/reload` をまたいで保持されます。
速度の設定は `/reload` で `config.mcfunction` の値に戻ります。

---

## 設定を変える

調整する値は **`data/autumn/function/config.mcfunction` の1ファイルだけ**にまとまっています。

| 定数 | 既定値 | 意味 |
| --- | --- | --- |
| `#interval` | `5` | 何 tick ごとに1サイクル回すか（20 = 1秒）。小さいほど速く・重い |
| `#samples` | `48` | 1サイクル・1プレイヤーあたり何ブロック調べるか。大きいほど速く・重い |
| `#chance` | `30` | 隣接する葉1ブロックあたりの変化確率（%） |
| `#inherit` | `80` | 伝播元と同じ色を継ぐ確率（%）。`0` で完全ランダム |
| `radius_xz` | `24` | 水平方向の探索半径（ブロック） |
| `radius_y` | `16` | 上下方向の探索範囲（ブロック） |
| `colors` | 赤/橙/黄 | 置き換えに使うポプラの葉ブロック ID |

編集後は `/reload` してから `/function autumn:config`。

速度プリセットの中身:

| | `#interval` | `#samples` | `#chance` | `radius_xz` | `radius_y` |
| --- | --- | --- | --- | --- | --- |
| normal | 5 | 48 | 30 | 24 | 16 |
| fast | 2 | 96 | 60 | 20 | 12 |
| turbo | 1 | 160 | 100 | 16 | 10 |

演出（パーティクル・音）は `data/autumn/function/internal/effects.mcfunction` にあります。

> `colors` のブロック ID を変えたときは、検出側の
> `data/autumn/tags/block/poplar_leaves.json` と、演出側の
> `internal/effects.mcfunction` のパーティクルも合わせてください。

---

## 負荷について

全チャンクの走査はしません。**プレイヤーの周囲をランダムサンプリング**する方式です。

- 毎 tick 走るのは `autumn:tick` の 2 コマンドだけ
- 実際の処理は `#interval` tick に1回、`#samples` 個のランダム地点を調べるだけ
- 大半のサンプルは「そこはポプラの葉ではない」で終わるので、1地点あたり実質数コマンド
- 状態の読み取り・設置・演出が走るのは、実際に葉が変化したときだけ

既定値（interval 5 / samples 48）で 1 秒あたりおよそ 200 サンプル。
録画中でも fps には影響しません。

紅葉した面積が広がるほど「ポプラの葉に当たる確率」が上がるため、
**最初はゆっくり、だんだん加速する**挙動になります。動画映えする一方、
序盤が遅いと感じたら `autumn:speed/fast` を使ってください。

`radius_xz` / `radius_y` を**狭くする**と、同じサンプル数でも密度が上がって
体感速度が上がります。撮影対象の木の周りだけ染めたいときはこちらが有効です。

---

## 仕組み

```
minecraft:tick
  └ autumn:tick                 毎 tick / 2コマンドだけ
      └ autumn:internal/cycle           #interval tick ごと
          ├ /trigger autumn.toggle の受付
          └ (プレイヤーごとに) run_samples
              └ sample_loop               #samples 回くり返す
                  └ sample   … ランダムな相対座標を3つ引く
                      └ probe    … そこがポプラの葉か？（大半はここで終了）
                          └ spread   … 元の色を控えて6近傍へ
                              └ try_convert … 普通の葉か？
                                  └ roll      … #chance % で判定
                                      └ convert  … 状態と色を引き継いで置き換え
                                          ├ place    … setblock
                                          └ effects  … パーティクルと音
```

ファイル一覧:

| ファイル | 役割 |
| --- | --- |
| `function/config.mcfunction` | **調整はここだけ** |
| `function/load.mcfunction` | 初期化 |
| `function/tick.mcfunction` | 毎 tick のタイマー |
| `function/on.mcfunction` / `off` / `status` | 操作用 |
| `function/speed/*.mcfunction` | 速度プリセット |
| `function/internal/*.mcfunction` | 内部処理 |
| `tags/block/poplar_leaves.json` | ポプラの葉の判定（伝播元） |
| `tags/block/spreadable_leaves.json` | 染まる対象の葉（既定は `#minecraft:leaves`） |

スコアボードは `autumn.config`（設定と状態）、`autumn.tmp`（一時値）、
`autumn.toggle`（`/trigger` 用）の3つ。ストレージは `autumn:config` と `autumn:tmp`。
