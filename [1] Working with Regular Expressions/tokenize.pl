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

my @tokens = filter(split /'s[^a-zA-Z]+|[^a-zA-Z0-9]+/, $text);
say "\ntokens = [", join(", ", @tokens), "]";
my $num_types = count_types(@tokens);
say "# of tokens = ", scalar @tokens;
say "# of types = ", $num_types, "\n";

my @punctuations = split /[a-zA-Z0-9 \n]+/, $text;
shift @punctuations;
my %punctuations_count = count_punctuations(@punctuations);
say "punctuations:";
while(my ($k, $v) = each %punctuations_count) {
    print "[$k : $v]\n"
}

my $search;
my @results;
while(1) {
    print "\nsearch: ";
    $search = <STDIN>;
    $search = reformat($search);
    @results = search($search, @tokens);
    say "results = [", join(", ", @results), "]";
}

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
        if(!type_exist($token, @types)) {
            push @types, $token;
        }
    }
    return scalar @types;
}

sub type_exist {
    my ($token_val, @types_arr) = @_;
    for my $type (@types_arr) {
        if(uc($token_val) eq uc($type)) {
            return 1;
        }
    }
    return 0;
}

sub count_punctuations {
    my (@punctuations) = @_;
    my %punctuations_count;

    for my $punctuation (@punctuations) {
        if(exists $punctuations_count{$punctuation}) {
            $punctuations_count{$punctuation}++;
        } else {
            $punctuations_count{$punctuation} = 1;
        }
    }
    return %punctuations_count;
}

sub reformat {
    my ($search_val) = @_;
    $search_val =~ s/\*/\.\+/g;
    $search_val =~ s/\?/\./g;
    chomp $search_val;
    $search_val = "\\b" . $search_val . "\\b";
    return $search_val;
}


sub search {
    my ($search_val, @tokens_arr) = @_;
    my @results;

    for my $token (@tokens_arr) {
        if($token =~ /$search_val/i) {
            if(!result_exist($token, @results)) {
                push @results, $token;
            }
        }
    }
    return @results;
}

sub result_exist {
    my ($token_val, @results_arr) = @_;
    for my $result (@results_arr) {
        if($token_val eq $result) {
            return 1;
        }
    }
    return 0;
}
