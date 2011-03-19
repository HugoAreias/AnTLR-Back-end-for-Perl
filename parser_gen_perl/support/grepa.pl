#!/usr/bin/perl

$/ = "snapshot=";

$max = 0;
while(<>) {
    my $local = 0;
    /mem_heap_B=(\d+)/ and $local += $1;
    /mem_heap_extra_B=(\d+)/ and $local += $1;
    /mem_stacks_B=(\d+)/ and $local += $1;
    $max = $local if $local > $max
}
$max = $max / 1048576 if $max > 0;
print STDERR "MAX MEMORY USED: $max MB\n";
