use strict;
use warnings;

use feature 'say';

my $text = "";
my $input_file = "input.txt";

open my $fh, '<', $input_file
    or die "Can't open file : $!";

while(my $line = <$fh>){
    $text = $text . "" . $line;
}

close $fh or die "Can't close file : $!";



