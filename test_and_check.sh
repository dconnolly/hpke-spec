#/bin/bash

set -e

clean=0
test=0
while [ $# -gt 0 ]; do
    case "$1" in
        -c) clean=1 ;;
        -c) test=1 ;;
    esac
    shift
done

# Clean
if [ "$clean" = 1 ]; then
    cargo clean
fi

# Build
cargo build --tests

# Test
if [ "$test" = 1 ]; then
    cargo test
fi

# Typecheck and extract
cargo hacspec -o fstar/Hacspec.Cryptolib.fst hacspec_cryptolib
cargo hacspec -o fstar/Hpke.fst hpke
