#!/bin/bash
#SBATCH --time=06:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=8GB
#SBATCH --job-name ik_gwas1
#SBATCH --output=%x-%j.SLURMout
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kaufm202@msu.edu

###Change to current working directory
cd ${HOME}/PLB812/data2

###Add conda environment to the path
export PATH="${HOME}/miniconda3/envs/plb812/bin:${PATH}"
export LD_LIBRARY_PATH="${HOME}/miniconda3/envs/plb812/lib:${LD_LIBRARY_PATH}"

###download SRA file
#cd raw_sequence

#prefetch SRR492407
#mv SRR492407/SRR492407.sra .
#rmdir SRR492407
#fasterq-dump --split-3 SRR492407.sra

#cd ..

###Run fastqc on raw file

fastqc -o fastqc/ raw_sequence/SRR492407_2.fastq
#raw_sequence/SRR492407_1.fastq
