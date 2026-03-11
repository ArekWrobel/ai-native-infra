#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PKG_DIR="$REPO_ROOT/packages/ai-toolkit"
WORKFLOW_FILE="$REPO_ROOT/.github/workflows/ci.yml"
TMP_NPM_CACHE="$(mktemp -d /tmp/npm-cache-ai-native-XXXXXX)"
TMP_PROJECT_ROOT="$(mktemp -d /tmp/ai-toolkit-smoke-XXXXXX)/project"

cleanup() {
  rm -rf "$TMP_NPM_CACHE"
  rm -rf "$(dirname "$TMP_PROJECT_ROOT")"
}
trap cleanup EXIT

echo "==> 1) CLI help check"
node "$PKG_DIR/bin/cli.js" help >/dev/null
echo "PASS: CLI help"

echo "==> 2) npm pack dry-run (isolated cache)"
(
  cd "$PKG_DIR"
  npm_config_cache="$TMP_NPM_CACHE" npm pack --dry-run >/dev/null
)
echo "PASS: npm pack --dry-run"

echo "==> 3) workflow marker check"
if grep -q "OVH_NPM_REGISTRY_URL" "$WORKFLOW_FILE" && grep -q "OVH_NPM_TOKEN" "$WORKFLOW_FILE" && grep -q "npm publish" "$WORKFLOW_FILE"; then
  echo "PASS: workflow markers"
else
  echo "FAIL: workflow markers missing in $WORKFLOW_FILE"
  exit 1
fi

echo "==> 4) installer/uninstaller smoke test"
mkdir -p "$TMP_PROJECT_ROOT"
PROJECT_ROOT="$TMP_PROJECT_ROOT" INSTALL_COPY=1 node "$PKG_DIR/install.js" >/dev/null

test -d "$TMP_PROJECT_ROOT/.codexai/skills/code-review"
test -f "$TMP_PROJECT_ROOT/.codexai/.ai-toolkit-manifest.json"
test -f "$TMP_PROJECT_ROOT/CODEXAI.md"

node "$PKG_DIR/uninstall.js" "$TMP_PROJECT_ROOT" >/dev/null
test ! -f "$TMP_PROJECT_ROOT/.codexai/.ai-toolkit-manifest.json"
echo "PASS: install/uninstall smoke test"

echo "==> 5) reference guard checks"
if rg -n "\\.claude|CLAUDE\\.md|CodeArtifact|AWS" \
  "$REPO_ROOT/README.md" \
  "$REPO_ROOT/context" \
  "$REPO_ROOT/terraform" \
  "$REPO_ROOT/packages" \
  "$REPO_ROOT/.github" \
  "$REPO_ROOT/CODEXAI.md" >/dev/null 2>&1; then
  echo "FAIL: found legacy references (.claude/CLAUDE.md/CodeArtifact/AWS)"
  exit 1
fi
echo "PASS: no legacy references"

echo "==> 6) terraform checks (optional)"
if command -v terraform >/dev/null 2>&1; then
  (
    cd "$REPO_ROOT/terraform"
    terraform fmt -check -recursive
    terraform validate
  )
  echo "PASS: terraform fmt + validate"
else
  echo "SKIP: terraform not installed"
fi

echo "All verification checks passed."
