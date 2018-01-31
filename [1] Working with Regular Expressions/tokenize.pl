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

my @tokens = filter(split /'s|[^a-zA-Z]+/, $text);
say "tokens = [" . join(", ", @tokens) . "]";

sub filter {
    my (@filtered) = @_;
    for my $token (@filtered) {
        if($token eq "ll") {
            $token = "will";
        }elsif($token eq "d") {
            $token = "would";
        }elsif($token eq "re") {
            $token = "are";
        }
    }
    return @filtered;
}



