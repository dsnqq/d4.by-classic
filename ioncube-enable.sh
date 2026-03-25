#!/bin/sh
set -eu

# If ionCube loader binary is mounted into /ioncube, enable it via zend_extension.
# The project contains ionCube-protected files that expect a loader like:
#   /ioncube/ioncube_loader_lin_8.2.so

LOADER_82="/ioncube/ioncube_loader_lin_8.2.so"
LOADER=""

if [ -f "$LOADER_82" ]; then
  LOADER="$LOADER_82"
else
  # Try a best-effort match for other libc/pattern variants.
  CANDIDATE="$(ls -1 /ioncube/ioncube_loader_*_8.2*.so 2>/dev/null | head -n 1 || true)"
  if [ -n "${CANDIDATE:-}" ]; then
    LOADER="$CANDIDATE"
  fi
fi

INI_FILE="/usr/local/etc/php/conf.d/00-ioncube.ini"

if [ -n "$LOADER" ] && [ -f "$LOADER" ]; then
  echo "zend_extension=$LOADER" > "$INI_FILE"
else
  # Do not fail container startup if loader is missing; the site will show its own error.
  rm -f "$INI_FILE" 2>/dev/null || true
fi

exec "$@"

