#!/bin/bash
#SBATCH --time=12:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=64GB
#SBATCH --job-name ik_lab8
#SBATCH --output=%x-%j.SLURMout
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kaufm202@msu.edu

### Change to current working directory
cd ${HOME}/PLB812/data2

### Add conda environment to the path
export PATH="${HOME}/miniconda3/envs/gatk/bin:${PATH}"
export LD_LIBRARY_PATH="${HOME}/miniconda3/envs/gatk/lib:${LD_LIBRARY_PATH}"

sra="SRR492407"

### Mark duplicates
#gatk MarkDuplicates -I alignments/${sra}_aligned.bam -O alignments/${sra}_dup_marked.bam -M alignments/${sra}_dup_metrics

### Add read groups
#gatk AddOrReplaceReadGroups -I alignments/${sra}_dup_marked.bam -O alignments/${sra}_read_group.bam -ID 1 -LB lib1 -PL ILLUMINA -PU NA -SM WS2

#gatk CreateSequenceDictionary -R genome-assembly/Athaliana_447_TAIR10.fa

gatk --java-options "-Xmx4g" HaplotypeCaller  \
   -R genome-assembly/Athaliana_447_TAIR10.fa \
   -I alignments/${sra}_read_group.bam \
   -O variant_call/${sra}_output.vcf
