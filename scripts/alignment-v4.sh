#!/bin/bash
#SBATCH --time=6:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=10
#SBATCH --mem=100GB
#SBATCH --job-name ik_align
#SBATCH --output=%x-%j.SLURMout
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kaufm202@msu.edu

#Change to current working directory
cd ${HOME}/PLB812/data

#Add conda environment to the path
export PATH="${HOME}/miniconda3/envs/plb812/bin:${PATH}"
export LD_LIBRARY_PATH="${HOME}/miniconda3/envs/plb812/lib:${LD_LIBRARY_PATH}"

cd genome_assembly-v4

sra_list="ERR754055 ERR754056 ERR754070 ERR754072 ERR754075 ERR754076"

#Find splice sites
#gffread --gtf Athaliana_447_Araport11_gene.gff3 > a_thaliana_annotation.gtf

hisat2_extract_splice_sites.py a_thaliana_annotation.gtf > at_splicesites.tsv
hisat2_extract_exons.py a_thaliana_annotation.gtf > at_exons.tsv

#Build index
hisat2-build -p 10 Athaliana_447_TAIR10.fa --ss at_splicesites.tsv --exon at_exons.tsv at_genome_index

cd ..

#Align reads
for sra in ${sra_list}
do
hisat2 -p 10 -x genome_assembly-v4/at_genome_index -1 trimmed_files/${sra}_1_trim_paired.fq.gz -2 trimmed_files/${sra}_2_trim_paired.fq.gz | samtools view -@ 4 -bh | samtools sort -@ 4 > align_outputs-v4/${sra}_aligned.bam 
done
