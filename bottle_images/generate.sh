#!/bin/sh

cat $(pwd)/bottle_0.svg | \
inkscape -z -C -w 256 --file=/dev/stdin --export-png=$(pwd)/../src/static/bottle_0.png

generate_batch() {
    for i in {1..5}; do
        cat bottle_$i.svg | \
        sed "s/77d9f5/$2/g" | \
        sed "s/ceeef1/$3/g" | \
        inkscape -z -C -w 256 --file=/dev/stdin --export-png=$(pwd)/../src/static/bottle_$1$i.png
    done
}

generate_batch 0 ffc2d1 fff5f8
generate_batch 1 ffe4a4 fff9d8
generate_batch 2 65e37f c2f9cc
generate_batch 3 77d9f5 ceeef1
generate_batch 4 f0caff feebff
