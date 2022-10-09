Indexing:
I used hisat2-build to make my index so I could align with hisat2. To do so, I first converted my gtf annotations file to gff using gffread. I then used hisat2_extract_splice_sites.py and hisat2_extract_exons.py to get exon and splice sites from the gff annotation file to be used as arguments in hisat2-build in order to create a splice-conscious index for alignment.

Alignment:
I used hisat2 for alignment using the index that was generated, with the trimmed forward and reverse read files. I used the piping with samtools view and sort with -bh to get bam file outputs with the headers. 
