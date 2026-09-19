# minecraft-datapacks

Minecraft Java Edition 向けのデータパック置き場。`packs/<パック名>/` に1パック1ディレクトリ。

## パック

| パック | 対象バージョン | 内容 |
| --- | --- | --- |
| [`spreading-autumn-leaves`](packs/spreading-autumn-leaves/) | 26.3 | 紅葉が広がる。ポプラの葉が隣の葉を赤・橙・黄に染めていく |
| [`if-name-length`](packs/if-name-length/) | 26.3 | 文字数が力。持ち物の名前の文字数がそのまま攻撃力になる（ifシリーズ） |

## ifシリーズ

「もし○○な世界だったら」を1パック1ルールで作るシリーズ。企画メモは
[`docs/if-series-shorts.md`](docs/if-series-shorts.md)（ショート動画向け・優先）と
[`docs/if-series-ideas.md`](docs/if-series-ideas.md)（腰を据えて遊ぶ用）。

## 配布用 zip を作る

```sh
./scripts/pack.sh                          # packs/ 配下を全部
./scripts/pack.sh spreading-autumn-leaves  # 指定したパックだけ
# -> dist/<パック名>.zip
```

## 動画素材（`assets/`）

動画の生素材はこのリポジトリの本来の目的（データパック公開）とは無関係なので `assets/` は git 管理対象外（`.gitignore` 参照）。ローカルに以下の構成で置く。

```
assets/
  <YYYYMMDD>_<企画名>/
    raw/      # OBSの生録画 (mkv)
    voice/    # VOICEVOXの音声書き出し
    export/   # 最終書き出し (mp4)
```
