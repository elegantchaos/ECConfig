#!/usr/bin/env bash

FRAMEWORK_ROOT="${BUILT_PRODUCTS_DIR}/${CONTENTS_FOLDER_PATH}"

mkdir -p "${FRAMEWORK_ROOT}/Versions"
/bin/ln -sfh A "${FRAMEWORK_ROOT}/Versions/Current"
/bin/ln -sfh Versions/Current/Headers "${FRAMEWORK_ROOT}/Headers"
/bin/ln -sfh Versions/Current/Resources "${FRAMEWORK_ROOT}/Resources"
/bin/ln -sfh "Versions/Current/${PRODUCT_NAME}" "${FRAMEWORK_ROOT}/${PRODUCT_NAME}"
