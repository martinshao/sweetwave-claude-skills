#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

cat <<'EOM'
正在使用当前仓库内容更新 SweetWave skills。

如需获取团队最新版本，请先在本仓库执行：
  git pull

EOM

"$SCRIPT_DIR/install-global.sh" update
