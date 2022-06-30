# Author: Srinivas Ramachandran
# Convert a bed file to a wig file for paired end sequencing : fill in the reads
# 

BEGIN { push @INC, 'lib', 'perl_library' }

use genome_size;
use ngs;

die "Usage: perl bed2wig.pl <BED FILE LIST> <WIG FILE NAME> <MIN> <MAX> <STEP> <GENOME>\n" if(!$ARGV[5]);
print STDERR "$ARGV[0] OUT: $ARGV[1] MIN: $ARGV[2] MAX: $ARGV[3]\n";


#$bed_file,$min,$max,$step,$genome,$tgs

$outfile = $ARGV[1];

$min=$ARGV[2];
$max=$ARGV[3];

$step = $ARGV[4];
$genome = $ARGV[5];

$tgs = &genome_size::getSize($ARGV[5]);

$twig = &ngs::readbed_spike_list($ARGV[0],$min,$max,$step,$genome,$tgs,$ARGV[6]);

%wig = %{$twig};

$jnk = &ngs::writeWig_general(\%wig,$outfile,$step);
