# macroH2A_HSV
Code for domain analysis of macroH2A CUT&amp;Tag data

To call domains:

Step 1: Create wig file from CUT&Tag paired end bed file, with additional input of number of spike-in reads:

perl bed2wig_spike_list.pl <list_of_bed_files> <output_wig_file_name> <min fragment length> <max fragment length> <step size - use 100> <genome name - ex. "hg38">

Step 2: Create 1000 bp running average of the wig file from step 1:

perl gen_ra_noIN.pl <input wig file> 1000 <output wig file> <step size - use 100>

Step 3: Get genome-wide median and histogram of the wig file from step 2:

perl wig_param_print.pl <Wig file> > <histogram> 2> <parameters_output_file>

Step 4: Call domains:

perl call_domains_v4_hardCutoff.pl <Wig file from step 2> <Input or IgG wig file> <Cutoff - 2*median from step 3> 1000 > <Domain_list_bed_file>

----------------

Other contents:

disjoin.R - Simple R script to perform disjoin function on an input bed file
  
bed_score_l2.pl - Simple perl script to calculate log 2 enrichment of intervals in an input bed file. Other inputs: CUT&Tag wig file, IgG CUT&Tag wig file
  
reduce.R - Simple R script to perform "reduce" function on an input bed file
