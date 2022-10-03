#!/bin/bash
#SBATCH --time=12:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=32GB
#SBATCH --job-name idk_trim
#SBATCH --output=%x-%j.SLURMout
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kaufm202@msu.edu

#Change to current working directory
cd ${HOME}/PLB812/data

#Add conda environment to the path
export PATH="${HOME}/miniconda3/envs/plb812/bin:${PATH}"
export LD_LIBRARY_PATH="${HOME}/miniconda3/envs/plb812/lib:${LD_LIBRARY_PATH}"

sra_list="ERR754055 ERR754056 ERR754070 ERR754075 ERR754076"

cd raw_fastq_files

#Trim reads
for sra in ${sra_list}
do
trimmomatic PE ${sra}_1.fastq ${sra}_2.fastq ../trimmed_files/${sra}_1_trim_paired.fq.gz ../trimmed_files/${sra}_1_trim_unpaired.fq.gz ../trimmed_files/${sra}_2_trim_paired.fq.gz ../trimmed_files/${sra}_2_trim_unpaired.fq.gz ILLUMINACLIP:/mnt/home/kaufm202/miniconda3/envs/plb812/share/trimmomatic-0.39-2/adapters/TruSeq2-PE.fa:2:30:10:2:True LEADING:3 TRAILING:3 MINLEN:36
done

#Run fastqc on trimmed reads
cd ../trimmed_files
for sra in ${sra_list}
do
fastqc -o ../fastqc_trim_files/ ${sra}_1_trim_paired.fq.gz ${sra}_2_trim_paired.fq.gz
done
