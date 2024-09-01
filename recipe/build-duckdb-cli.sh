#!/bin/bash

set -euxo pipefail

BUILD_SHELL=1 BUILD_JSON=1 BUILD_HTTPFS=1 BUILD_ICU=1 make -j $CPU_COUNT
cp ./build/release/duckdb $PREFIX/bin
