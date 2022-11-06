Everything I ran is in scripts2/assignment_7.sh. I did not run it all at once, but still used it as a log and to run on HPCC for the heavier tasks.

I already had the Arabidopsis sequence and annotations so I copied that over to my new directories. I used prefetch and fastq-dump to get the SRA file. The fastqc showed some definite quality problems. No adapter contamination came up, but I ran adapter trimming anyways just in case there are some low count adapter sequences. I trimmed quality at phred score of 25 and then increased my minimum length to 50. After trimming, the quality on the fastqc is much better.

I used bwa index to index the genome. I then ran bwa mem piped into samtools sort to output just the sorted ba file, and used multithreading of 8 to speed it up. I then ran samtools flagstat on the bam output and found that all the reads passed QC and 97.74% of the reads were mapped.
