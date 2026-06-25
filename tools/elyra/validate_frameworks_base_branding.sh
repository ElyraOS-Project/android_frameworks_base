#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT_DIR"

echo "== ElyraOS frameworks/base validation =="

if grep -R "ELYRA_VERSION" -n core/java/android/os/Build.java >/dev/null; then
  echo "[OK] Build.ELYRA_VERSION is present"
else
  echo "[WARN] Build.ELYRA_VERSION was not found"
fi

if grep -R "ro.elyra.display.version" -n core/java/android/os/Build.java >/dev/null; then
  echo "[OK] Build.ELYRA_DISPLAY_VERSION property hook is present"
else
  echo "[WARN] Build.ELYRA_DISPLAY_VERSION property hook was not found"
fi

if grep -R "ElyraOS Frameworks Base" -n README_ELYRA.md >/dev/null; then
  echo "[OK] ElyraOS repository documentation is present"
else
  echo "[WARN] ElyraOS repository documentation was not found"
fi

echo ""
echo "Expected Lineage compatibility references:"
compat_paths=(README_ELYRA.md packages services core libs cmds)
compat_pattern="org\.lineageos\.platform|lineage-sdk|LineageSettingsProvider"
grep -R -E "$compat_pattern" -n "${compat_paths[@]}" 2>/dev/null | sed 's/^/  /' || true
