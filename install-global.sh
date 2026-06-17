#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILLS_SRC="$SCRIPT_DIR/skills"
TEMPLATES_SRC="$SCRIPT_DIR/templates"

SKILLS_TARGET="$HOME/.claude/skills"
TEMPLATES_TARGET="$HOME/.claude/sweetwave/templates"

mkdir -p "$SKILLS_TARGET"
mkdir -p "$TEMPLATES_TARGET"

if [ ! -d "$SKILLS_SRC" ]; then
  echo "错误：未找到 skills 源目录：$SKILLS_SRC" >&2
  exit 1
fi

echo "正在安装 SweetWave 中文版 skills 到：$SKILLS_TARGET"

for skill_dir in "$SKILLS_SRC"/sw-*; do
  [ -d "$skill_dir" ] || continue
  skill_name="$(basename "$skill_dir")"
  rm -rf "$SKILLS_TARGET/$skill_name"
  cp -R "$skill_dir" "$SKILLS_TARGET/$skill_name"
  echo "  已安装 /$skill_name"
done

if [ -d "$TEMPLATES_SRC" ]; then
  cp -R "$TEMPLATES_SRC"/. "$TEMPLATES_TARGET"/
  echo "已安装 SweetWave 中文模板到：$TEMPLATES_TARGET"
fi

cat <<'EOM'

SweetWave 个人级 skills 中文版已安装完成。

下一步：
  1. cd /path/to/your-project
  2. claude
  3. 执行 /sw-help
  4. 执行 /sw-init

EOM
