# minecraft-datapacks

Minecraft Java Edition 向けのデータパック置き場。`packs/<パック名>/` に1パック1ディレクトリ。

## パック

| パック | 対象バージョン | 内容 |
| --- | --- | --- |
| [`spreading-autumn-leaves`](packs/spreading-autumn-leaves/) | 26.3 | 紅葉が広がる。ポプラの葉が隣の葉を赤・橙・黄に染めていく |

## 配布用 zip を作る

```sh
./scripts/pack.sh                          # packs/ 配下を全部
./scripts/pack.sh spreading-autumn-leaves  # 指定したパックだけ
# -> dist/<パック名>.zip
```
