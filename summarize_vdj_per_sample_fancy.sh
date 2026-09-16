#!/bin/sh

# summarize_vdj_per_sample_fancy.sh
# This script extracts the following from a directory of VDJ contig_annotations and writes them to a .csv file:
# Sample name
# total cells
# total IGH seqs  
# total IGK seqs
# total IGL seqs

# NOTES
# column names
# barcode,is_cell,contig_id,high_confidence,length,chain,v_gene,d_gene,j_gene,c_gene,full_length,productive,cdr3,cdr3_nt,reads,umis,raw_clonotype_id,raw_consensus_id
# WE NEED COLUMN 6 and to filter based on that
# total cells function: zcat ${sample} | cut -d, -f1 | tail -n+2 | sort | uniq | wc -l

file_path='/home/camaia/data/more_datasets/GSE183051_VDJ_data/contig_annotations/'
touch output_file.csv
echo "sample,total cells,total IGH seqs,total IGK seqs,total IGL seqs" >> output_file.csv

for name in $(ls -1 ${file_path}*.csv.gz);
do
	sample="$(basename ${name}),"
	ncell="$(zcat ${name} | cut -d, -f1 | tail -n+2 | sort | uniq | wc -l),"
	n_igh="$(zcat ${name} | cut -d, -f6 | tail -n+2 | grep "IGH" | wc -l),"
	n_igk="$(zcat ${name} | cut -d, -f6 | tail -n+2 | grep "IGK" | wc -l),"
	n_igl="$(zcat ${name} | cut -d, -f6 | tail -n+2 | grep "IGL" | wc -l),"

	echo "${sample}${ncell}${n_igh}${n_igk}${n_igl}" >> output_file.csv
done

