use strict;
use warnings;
use feature 'say';

my $text;
my $input_file = "input.txt";

open my $fh, '<', $input_file
    or die "Can't open file : $!";
while(my $line = <$fh>){
    $text = $text . "" . $line;
}
close $fh or die "Can't close file : $!";

my @tokens = filter(split /'s[^a-zA-Z]+|[^a-zA-Z]+/, $text);
say "tokens = [", join(", ", @tokens), "]";
my $num_types = count_types(@tokens);
say "# of tokens = ", scalar @tokens;
say "# of types = ", $num_types;

sub filter {
    my (@filtered) = @_;
    for my $token (@filtered) {
        if($token eq "ll") {
            $token = "will";
        } elsif($token eq "d") {
            $token = "would";
        } elsif($token eq "re") {
            $token = "are";
        }
    }
    return @filtered;
}

sub count_types {
    my (@arr) = @_;
    my @types;

    for my $token (@arr) {
        if(!exist($token, @types)) {
            push @types, $token;
        }
    }
    return scalar @types;
}

sub exist {
    my ($token, @types) = @_;
    for my $type (@types) {
        if($token eq $type) {
            return 1;
        }
    }
    return 0;
}

