# 文字数が力 / Name Length Is Power

**もし、持ち物の名前の文字数がそのまま強さだったら。**

「土」は1文字だから最弱。「ダイヤモンドの剣」は8文字なので、
7文字の「ネザライトの剣」より強い。
そして金床で長い名前を付ければ、棒でもエンダードラゴンをワンパンできます。

ifシリーズ（`docs/if-series-shorts.md`）の1本目。ショート動画向け。

対象: **Minecraft Java Edition 26.3**（`min_format` / `max_format` = `121.0`）

---

## ルール

```
攻撃力 = 名前の文字数 × 名前の文字数 × 倍率(既定 1)
```

| 持ち物 | 文字数 | 攻撃力 |
| --- | --- | --- |
| 土 | 1 | 1 |
| 木の剣 | 3 | 9 |
| ニンジン | 4 | 16 |
| 金のニンジン | 6 | 36 |
| **ネザライトの剣** | 7 | **49** |
| **ダイヤモンドの剣** | 8 | **64** ← ネザライトより強い |
| ダイヤモンドのツルハシ | 11 | 121 |
| エンチャントされた金のリンゴ | 14 | 196 |
| 錆止め加工した酸化した切り込み入りの銅の階段 | 22 | 484 |
| 金床で27文字に改名した棒 | 27 | **729**（エンダードラゴンは体力200） |

- 文字数は**メインハンドに持っている物**だけを見ます（防具・オフハンドは無関係）
- **金床で付けた名前が最優先**。バニラ名のテーブルより強い扱いです
- 画面には常に `⚔ 8文字 → 攻撃力 64` が出ます（動画でナレーションが要らなくなる）
- 攻撃力が高いほど、殴ったときの演出が派手になります（攻撃力729以上で閃光・爆発・雷鳴・ウィザーの声が全部乗り）

> プレイヤーの攻撃力属性を書き換える方式なので、**武器そのものの攻撃力は上乗せされます**
> （ネザライトの剣なら +8 程度）。文字数の2乗に対しては誤差なので、上の表の大小関係は変わりません。

---

## 導入

### 検証ワールドで使う（シンボリックリンク）

```sh
ln -s /path/to/minecraft-datapacks/packs/if-name-length \
      "/path/to/.minecraft/saves/<ワールド名>/datapacks/if-name-length"
```

ワールドに入って `/reload`。チャットに `[文字数] Name Length Is Power を読み込みました`
と出れば成功です。読み込み時点で **ON** になっています。

### 配布用 zip を作る

```sh
./scripts/pack.sh if-name-length
# -> dist/if-name-length.zip
```

---

## コマンド

| コマンド | 内容 |
| --- | --- |
| `/function namelen:status` | 現在の設定と、いま持っている物の文字数・攻撃力 |
| `/function namelen:on` | 有効化 |
| `/function namelen:off` | 無効化（攻撃力をバニラに戻す） |
| `/trigger namelen.toggle` | ON/OFF を反転（OP 権限なしで使える） |
| `/function namelen:preset/normal` | 倍率 1（通常） |
| `/function namelen:preset/movie` | 倍率 3（撮影用・短い名前でも画が持つ） |
| `/function namelen:debug/give` | **オチ用**。27文字の名前が付いた棒を配る（攻撃力 729） |
| `/function namelen:debug/probe` | 文字数の取得がズレていないか確認する（後述） |
| `/function namelen:config` | `config.mcfunction` の設定を再適用 |

ON/OFF の状態は `/reload` をまたいで保持されます。

---

## 撮影前に1回だけやること（文字数のズレ確認）

金床で付けた名前の文字数は NBT から直接数えています。バージョンによっては
名前が内部的に飾り付きで保存されていて、**見た目より多い数字**が返ることがあります。

1. 金床で適当な名前（例: 5文字）を付けたアイテムを持つ
2. `/function namelen:debug/probe`
3. 「生の値」が 5 なら問題なし。多いなら、その差を `config.mcfunction` の
   `#name_overhead` に入れて `/reload` → `/function namelen:config`

これで以降のリネームは全部正しく数えられます。

---

## 設定を変える

調整する値は **`data/namelen/function/config.mcfunction` の1ファイルだけ**です。

| 定数 | 既定値 | 意味 |
| --- | --- | --- |
| `#mult` | `1` | 攻撃力 = 文字数² × この値 |
| `#min` | `1` | 攻撃力の下限 |
| `#cap` | `2048` | 攻撃力の上限（攻撃力属性の上限に合わせてある） |
| `#default` | `0` | テーブルに無い物・素手のときの文字数 |
| `#interval` | `2` | 何 tick ごとに持ち物を見直すか。持ち替えの反応速度 |
| `#name_overhead` | `0` | カスタムネームの文字数の補正（上記の probe で決める） |
| `#actionbar` | `1` | `⚔ ◯文字 → 攻撃力 ◯` を常時表示するか |
| `#fx` | `1` | 殴ったときの演出を出すか |

編集後は `/reload` してから `/function namelen:config`。

### ネタを足す

バニラ名の文字数は `data/namelen/function/table.mcfunction` に1行ずつ入っています。

```
data merge storage namelen:table {items:{"minecraft:dirt":1,"minecraft:stone":1}}
```

**次回の台本は、ここに行を足すだけ**で用意できます。載っていないアイテムは
`#default` 扱いになるので、撮りたい物だけ入れておけば十分です。

> 文字数は 26.3 の日本語表示名に合わせています。表示名が違っていたら
> このファイルの数字を直すだけで直ります。

演出は `data/namelen/function/internal/fx.mcfunction`。**文字数ではなく攻撃力（namelen.dmg）基準**の
6段階（〜15 / 16〜63 / 64〜195 / 196〜399 / 400〜728 / 729〜）で、上に行くほどパーティクルと音を重ねる。
攻撃力基準にしているので、`preset/movie`（倍率3倍）だと短い名前でも上のランクに届く。

---

## 負荷について

`#interval`（既定 2）tick ごとに、**プレイヤー1人あたり十数コマンド**だけです。
ブロックの走査もエンティティの検索もしていないので、録画中の fps には影響しません。

殴ったときの演出はアドバンスメントで発火するので、殴らない限り何も走りません。

---

## 仕組み

```
minecraft:tick
  └ namelen:tick                  毎 tick / 2コマンドだけ
      └ namelen:internal/cycle            #interval tick ごと
          ├ /trigger namelen.toggle の受付
          └ (プレイヤーごとに) update
              ├ pick_item   … メインハンドのアイテムを取り出す
              ├ (1) カスタムネームの文字数を数える      ← 金床リネーム
              ├ (2) 無ければ lookup でテーブルを引く    ← バニラ名
              └ apply
                  ├ set_attack  … 攻撃力属性を書き換え
                  └ actionbar   … 画面表示

namelen:hit (advancement / player_hurt_entity)
  └ namelen:internal/on_hit
      └ fx                        … 文字数に応じた演出
```

| ファイル | 役割 |
| --- | --- |
| `function/config.mcfunction` | **調整はここだけ** |
| `function/table.mcfunction` | **ネタ追加はここだけ**（アイテム→文字数） |
| `function/load.mcfunction` | 初期化 |
| `function/tick.mcfunction` | 毎 tick のタイマー |
| `function/on` / `off` / `status` | 操作用 |
| `function/preset/*` | 倍率のプリセット |
| `function/debug/*` | 撮影用（オチの棒・文字数の確認） |
| `function/internal/*` | 内部処理 |
| `advancement/hit.json` | 殴ったことの検出 |

スコアボードは `namelen.cfg`（設定と状態）、`namelen.tmp`（一時値）、
`namelen.len` / `namelen.dmg`（プレイヤーごとの文字数・攻撃力）、
`namelen.toggle`（`/trigger` 用）。ストレージは `namelen:table` と `namelen:tmp`。
