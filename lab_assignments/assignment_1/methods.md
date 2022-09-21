This is the same as methods.txt, but I am trying to get better formatting on GitHub with auto-wrapping.

1. Obtaining Arabidopsis thaliana genome (sequence + annontations)
To obtain the genome for A. thaliana, I went to https://www.ncbi.nlm.nih.gov/genome/4?genome_assembly_id=380024, which appears to be the most recent genome assembly for A. thaliana (GCA_000001735.2 TAIR10.1). There is a link on there to the FASTA genome sequence, and GFF gene annotation files, so from my HPCC directory, I used the wget command for both files, and then used gunzip to unzip them, and mv to rename them to something more intuitive. 

2. Obtaining SRA files
My initial attempt to obtain the SRA files using prefetch failed since I used the code for the entire study and it subsequently started downloading all of the files from that study. I went back and parsed the website to find which files pertained to my genotype Cvi-0 and used "prefetch --max-size 100000000 ERR754072 ERR754070 ERR754055 ERR754075 ERR754076 ERR754056" to get only my Cvi-0 SRA files.

To convert the files, I first used fasterq-dump --split-3 "SRA_file", which gave me zipped and unzipped fastq files. I quickly found the unzipped files were way to large and ran out of disc space on my HPCC home directory. AFter screenshotting the head of one of the fastq files, I removed the unzipped files and used fastq-dump --gzip --split-3 "SRA_file" on each SRA file to get just the zipped fastq file for each.

A few days later, I got my home directory upgraded from 50GB to 1TB, so I went back and used fastq-dump --split-3 "SRA_file" on each so that I now have the zipped and unzipped files.
