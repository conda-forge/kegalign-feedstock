#!/usr/bin/env bash

set -o errexit
set -o nounset

BUILD_DIR="$SRC_DIR/build"
BIN_DIR="$PREFIX/bin"

mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

cmake "${CMAKE_ARGS}" -DCMAKE_BUILD_TYPE=Release "$SRC_DIR"
# EXPERIMENT, NOT FOR MERGE: show the real nvcc command line, so we can count
# the -gencode flags that actually get emitted.
make VERBOSE=1

install --mode 0755 --directory "$BIN_DIR"
install --mode 0755 "$SRC_DIR/build/kegalign" "$BIN_DIR"
install --mode 0755 "$SRC_DIR/scripts/diagonal_partition.py" "$BIN_DIR"
install --mode 0755 "$SRC_DIR/scripts/lastz-cmd.ini" "$BIN_DIR"
install --mode 0755 "$SRC_DIR/scripts/package_output.py" "$BIN_DIR"
install --mode 0755 "$SRC_DIR/scripts/runner.py" "$BIN_DIR"
install --mode 0755 "$SRC_DIR/scripts/run_kegalign" "$BIN_DIR"
install --mode 0755 "$SRC_DIR/scripts/run_lastz_tarball.py" "$BIN_DIR"
