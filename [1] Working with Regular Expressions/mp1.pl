use strict;
use warnings;
use diagnostics;
use feature 'say';
use feature 'switch';
use v5.16;;

#THIS IS NUMBER 4. COUNTING NUMBER OF QUOTATION MARKS 
my $string_test = "The black brown fox, sees me. How many punctutations do you see! hahaha! ! !";
my ($count_period, $count_excl, $count_comma, $count_dash, $count_el, $count_quot, $count_par, $count_hyp) = (0,0,0,0,0,0,0,0);
my ($count_col, $count_semcol, $count_ques ) = (0,0,0);
for my $char (split //, $string_test){
    if($char eq '!'){ $count_excl++; } 
    elsif($char eq '.'){ $count_period++; } 
    elsif($char eq '-'){ $count_hyp++;} 
    elsif($char eq ',') { $count_comma++; }
    elsif($char eq '_') { $count_dash++; }
    elsif($char eq '...') { $count_el++; }
    elsif($char eq '?') { $count_ques++; }
    elsif($char eq ':') { $count_col++; }
    elsif($char eq ';') { $count_semcol++; }
    elsif($char eq '(') { $count_par++; }
    elsif($char eq '"') { $count_quot++; }    
}


#THIS IS NUMBER 5. SEARCH
my $search_word = <STDIN>; #user input
chop $search_word; #chopping the black slash n
my $last_char = chop $search_word; #last character

my $foo = reverse($search_word);
my $first_char = chop $foo; #first character
$search_word = reverse($foo);
my $string_test5 = "bar kat brown black batch Ball catrd rat clat bat ba kek";

if(($last_char eq '*' || $last_char eq '?') && ($first_char eq '*' || $first_char eq '?')){
    if($last_char eq '*' && $first_char eq '?'){
        while ($string_test5 =~ /([a-zA-Z]?$search_word[a-zA-Z]*)/gi) { print "$1\n"; }
    } elsif($last_char eq '?' && $first_char eq '*' ){
        while ($string_test5 =~ /([a-zA-Z]*$search_word[a-zA-Z]?)/gi) { print "$1\n"; }
    } elsif($last_char eq '?' && $first_char eq '?' ) {
        while ($string_test5 =~ /([a-zA-Z]?$search_word[a-zA-Z]?)/gi) { print "$1\n"; }
    } elsif($last_char eq '*' && $first_char eq '*') {
        while ($string_test5 =~ /([a-zA-Z]*$search_word[a-zA-Z]*)/gi) { print "$1\n"; }
    }
} else {
    if(!($first_char eq '*' || $first_char eq '?')) { 
        $search_word = $first_char . $search_word; #stringing the first character
    }
    if($last_char eq '*'){   
        while ($string_test5 =~ /($search_word[a-zA-Z]+)/gi) { print "$1\n"; }
    } elsif($last_char eq '?'){
        while ($string_test5 =~ /($search_word[a-zA-Z]?[^a-zA-Z])/gi) { print "$1\n"; }
    } else {
        $search_word = $search_word . $last_char; #last char
    }
    if($first_char eq '*'){
        while ($string_test5 =~ /([a-zA-Z]*$search_word[^a-zA-Z])/gi) { print "$1\n"; } 
    } elsif($first_char eq '?'){
        while ($string_test5 =~ /([a-zA-Z]$search_word[^a-zA-z])/gi) { print "$1\n"; } 
    } elsif(!($last_char eq '*' || $last_char eq '?')){
        while ($string_test5 =~ /([^a-zA-z]$search_word[^a-zA-z])/gi ) { print "$1\n"; }
    }
}