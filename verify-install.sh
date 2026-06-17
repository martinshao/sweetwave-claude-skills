#!/usr/bin/env bash
set -euo pipefail

missing=0
for name in sw-help sw-status sw-init sw-brief sw-prd sw-design sw-arch sw-spec sw-task sw-work sw-verify sw-review sw-run sw-release sw-retro; do
  file="$HOME/.claude/skills/$name/SKILL.md"
  if [ -f "$file" ]; then
    echo "OK：/$name -> $file"
  else
    echo "缺失：/$name -> $file"
    missing=1
  fi
done

if [ "$missing" -ne 0 ]; then
  echo "部分 SweetWave skills 缺失。" >&2
  exit 1
fi

echo "全部 SweetWave skills 已安装。"
