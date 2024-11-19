#!/bin/bash -eux

IS_DEBUG=${PDFium_IS_DEBUG:-false}
ENABLE_V8=${PDFium_ENABLE_V8:-false}
OS=${PDFium_TARGET_OS:?}
TARGET_ENVIRONMENT=${PDFium_TARGET_ENVIRONMENT:-}
CPU=${PDFium_TARGET_CPU:?}
STAGING="$PWD/staging"

ARTIFACT_BASE="$PWD/pdfium"
[ "$ENABLE_V8" == "true" ] && ARTIFACT_BASE="$ARTIFACT_BASE-v8"
ARTIFACT_BASE="$ARTIFACT_BASE-$OS"
[ -n "$TARGET_ENVIRONMENT" ] && ARTIFACT_BASE="$ARTIFACT_BASE-$TARGET_ENVIRONMENT"
[ "$OS" != "$CPU" ] && ARTIFACT_BASE="$ARTIFACT_BASE-$CPU"
[ "$IS_DEBUG" == "true" ] && ARTIFACT_BASE="$ARTIFACT_BASE-debug"
ARTIFACT="$ARTIFACT_BASE.tgz"

pushd "$STAGING"
tar cvzf "$ARTIFACT" -- *
popd
