#!/usr/bin/perl

use warnings;
use strict;

my $line;
my @parts;
my $hour;

while($line = <>) {
  chomp $line;
  if($line =~ /new Date/) {
    #$line =~ s/T(\d+)/bumphour($1)/gimex;
    #$line =~ s/(.*)\ new\ Date\(\'(\d+)\-(\d+)\-(\d+)T(\d+):(\d+):(\d+)\'\), new Date\(\'(\d+)\-(\d+)\-(\d+)T(\d+):(\d+):(\d+)\'\)\ \],/$1 $5, $6 - $10, $11/;
    $line =~ s/(.*)\ new\ Date\(Date.UTC\((\d+), (\d+), (\d+), (\d+), (\d+), (\d+)\)\), new Date\(Date.UTC\((\d+), (\d+), (\d+), (\d+), (\d+), (\d+).*/$1 $5:$6 - $11:$12/;
#new Date(Date.UTC(2018, 11, 18, 15, 30, 00)), new Date(Date.UTC(2018, 11, 18, 17, 30, 00))
    $line =~ s/(\d+):/bumphour($1)/gimex;
    print $line, "\n";
  }
}

sub bumphour {

  # XXX assumes same date, not good

  my $in;
  $in = shift;
  $in -= 5;
  return "$in:";

}
