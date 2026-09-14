#!/usr/bin/env bash
#
# 配布用 zip を作る。
#
#   ./scripts/pack.sh                  … packs/ 配下の全パックを固める
#   ./scripts/pack.sh spreading-autumn-leaves   … 指定したパックだけ
#
# 出力先: dist/<パック名>.zip
# zip のルートに pack.mcmeta と data/ が来る形（Minecraft が要求する構造）。

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PACKS_DIR="${REPO_ROOT}/packs"
DIST_DIR="${REPO_ROOT}/dist"

if ! command -v zip >/dev/null 2>&1; then
  echo "error: zip コマンドが見つかりません (macOS なら標準で入っています)" >&2
  exit 1
fi

if [ "$#" -gt 0 ]; then
  targets=("$@")
else
  targets=()
  for d in "${PACKS_DIR}"/*/; do
    [ -d "$d" ] || continue
    targets+=("$(basename "$d")")
  done
fi

if [ "${#targets[@]}" -eq 0 ]; then
  echo "error: packs/ にパックがありません" >&2
  exit 1
fi

mkdir -p "${DIST_DIR}"

for name in "${targets[@]}"; do
  src="${PACKS_DIR}/${name}"

  if [ ! -f "${src}/pack.mcmeta" ]; then
    echo "error: ${src}/pack.mcmeta がありません" >&2
    exit 1
  fi

  out="${DIST_DIR}/${name}.zip"
  rm -f "${out}"

  # macOS の .DS_Store と拡張属性ファイルは除外する
  ( cd "${src}" && zip -r -q -X "${out}" pack.mcmeta data \
      -x '*.DS_Store' -x '__MACOSX/*' -x '._*' )

  size="$(du -h "${out}" | cut -f1)"
  echo "built: dist/${name}.zip (${size})"
done
