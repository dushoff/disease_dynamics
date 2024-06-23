use strict;
use 5.10.0;

## What a clear and intuitive way to do this! Yay, perl.
$/ = "";

while(<>){
	chomp;

	## The 2024 spreadsheet has sometimes 5 and sometimes six “slots” for material
	## Answer goes after the last slot
	my $space=5;
	$space++ if $.==1;
	my ($options, $ans) = /(.*)([1-5])$/s or die "Answer not parsed";
	my @matches = $options =~ /\n/g;
	while (scalar @matches < $space){
		$options .= "\n";
		@matches = $options =~ /\n/g;
	}
	$options =~ s/\n/\t/g;
	$options .= "$ans\t";
	print $options;
}
say "";
