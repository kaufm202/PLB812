#!/bin/bash
#SBATCH --time=12:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=10
#SBATCH --mem=32GB
#SBATCH --job-name ik_count
#SBATCH --output=%x-%j.SLURMout
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kaufm202@msu.edu

#Change to current working directory
cd ${HOME}/PLB812/data

#Add conda environment to the path
export PATH="${HOME}/miniconda3/envs/plb812/bin:${PATH}"
export LD_LIBRARY_PATH="${HOME}/miniconda3/envs/plb812/lib:${LD_LIBRARY_PATH}"

sra_list="ERR754055 ERR754056 ERR754070 ERR754072 ERR754075 ERR754076"

#Get counts
for sra in ${sra_list}
do
htseq-count --stranded=no -c counts-v2/${sra}_count_unstranded.tsv align_outputs-v3/${sra}_aligned.bam genome_assembly/AtRTD2_19April2016.gtf
done
