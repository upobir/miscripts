#!/bin/bash

for f in utils/*
do
    echo @synthetixio${f##utils}=$f
done

for f in protocol/*
do
    echo @synthetixio${f##protocol}=$f
done

for f in markets/*
do
    echo @synthetixio${f##markets}=$f