#!/bin/bash
#SBATCH --time=01:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=8GB
#SBATCH --job-name idk_fastqc
#SBATCH --output=%x-%j.SLURMout
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kaufm202@msu.edu

#Change to current working directory
cd ${HOME}/PLB812/data

#Add conda environment to the path
export PATH="${HOME}/miniconda3/envs/plb812/bin:${PATH}"
export LD_LIBRARY_PATH="${HOME}/miniconda3/envs/plb812/lib:${LD_LIBRARY_PATH}"

#Run fastqc on all fastq files

cd raw_fastq_files

fastqc -o ../fastqc_files/ ERR754055_1.fastq ERR754055_2.fastq ERR754056_1.fastq ERR754056_2.fastq ERR754070_1.fastq ERR754070_2.fastq ERR754075_1.fastq ERR754075_2.fastq ERR754076_1.fastq ERR754076_2.fastq
