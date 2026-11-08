#!/bin/sh
set -eu

if [ -z "${QUIZ_PASSWORD:-}" ]; then
  echo "QUIZ_PASSWORD ist nicht gesetzt. Container startet nicht." >&2
  exit 1
fi

QUIZ_USER_NAME="${QUIZ_USER:-klasse}"
HASH=$(printf '%s' "$QUIZ_PASSWORD" | openssl passwd -apr1 -stdin)
printf '%s:%s\n' "$QUIZ_USER_NAME" "$HASH" > /tmp/htpasswd
chmod 600 /tmp/htpasswd
