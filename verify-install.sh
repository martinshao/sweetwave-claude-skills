#!/usr/bin/env bash
set -euo pipefail

missing=0
for name in sw-help sw-status sw-init sw-brief sw-plan sw-prd sw-map sw-design sw-ui sw-arch sw-spec sw-task sw-scaffold sw-product-engineer sw-domain-engineer sw-ux-engineer sw-ui-design-engineer sw-architecture-engineer sw-spec-engineer sw-task-engineer sw-work sw-verify sw-review sw-run sw-frontend-engineer sw-backend-engineer sw-database-engineer sw-security-engineer sw-qa-engineer sw-doc-sync sw-release sw-retro; do
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
