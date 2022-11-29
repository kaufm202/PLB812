#!/bin/bash
#SBATCH --time=12:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=16GB
#SBATCH --job-name ik_ortho
#SBATCH --output=%x-%j.SLURMout
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kaufm202@msu.edu

### Change to current working directory
cd ${HOME}/PLB812/data2

### Add conda environment to the path
export PATH="${HOME}/miniconda3/envs/gatk/bin:${PATH}"
export LD_LIBRARY_PATH="${HOME}/miniconda3/envs/gatk/lib:${LD_LIBRARY_PATH}"

### Download fasta
#cd ortho/fasta/

#curl --cookie jgi_session=/api/sessions/ebda69415369b212dd897f3ea55c1cd2 --output download.20221128.203655.zip -d "{\"ids\":{\"Phytozome-291\":[\"56981cdc0d87851ee9727d1e\"],\"Phytozome-447\":[\"587b0ade7ded5e4229d885aa\"],\"Phytozome-323\":[\"5693356b0d87851ee9726afe\"]}}" -H "Content-Type: application/json" https://files.jgi.doe.gov/filedownload/
#unzip *.zip
#cd ../..

### Manually moved files

### Run OrthoFinder
cd ortho
orthofinder -f fasta
