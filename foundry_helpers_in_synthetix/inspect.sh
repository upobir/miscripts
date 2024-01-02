#!/bin/bash

for f in ./markets/perps-market/contracts/modules/*; do
    echo inspecting $f
    fname=${f##*/}
    echo \#\# $fname >> layout.md
    forge inspect $f:${fname%.*} storageLayout --pretty >> layout.md
    echo >> layout.md