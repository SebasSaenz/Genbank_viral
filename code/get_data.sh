#!/usr/bin/env bash

file=$1

rm rawdata/genomes_data.tsv.gz

wget -nc -P rawdata/ https://millardlab-inphared.s3.climb.ac.uk/$file

mv rawdata/$file rawdata/genomes_data.tsv.gz

gunzip rawdata/genomes_data.tsv.gz
