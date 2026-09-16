#!/bin/sh

file_path='/home/camaia/data/more_datasets/GSE183051_VDJ_data/contig_annotations/'

for name in $(ls -1 ${file_path}*.csv.gz);
do
	echo "Running: $(basename ${name})"
	echo $(zcat ${name} | cut -d, -f1 | tail -n+2 | sort | uniq | wc -l )
done

