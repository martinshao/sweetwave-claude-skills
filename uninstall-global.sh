#!/usr/bin/env bash
set -euo pipefail

SKILLS_TARGET="$HOME/.claude/skills"
TEMPLATES_TARGET="$HOME/.claude/sweetwave/templates"

echo "正在移除 SweetWave skills：$SKILLS_TARGET"
for name in sw-help sw-status sw-init sw-brief sw-plan sw-prd sw-map sw-design sw-ui sw-arch sw-spec sw-task sw-product-engineer sw-domain-engineer sw-ux-engineer sw-ui-design-engineer sw-architecture-engineer sw-spec-engineer sw-task-engineer sw-work sw-verify sw-review sw-run sw-frontend-engineer sw-backend-engineer sw-database-engineer sw-security-engineer sw-qa-engineer sw-doc-sync sw-release sw-retro; do
  rm -rf "$SKILLS_TARGET/$name"
  echo "  已移除 /$name"
done

read -r -p "是否删除 SweetWave 模板目录 $TEMPLATES_TARGET？[y/N] " answer
case "$answer" in
  [yY][eE][sS]|[yY])
    rm -rf "$TEMPLATES_TARGET"
    echo "模板目录已删除。"
    ;;
  *)
    echo "模板目录已保留。"
    ;;
esac
