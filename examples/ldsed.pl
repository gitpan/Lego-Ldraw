use Lego::Ldraw;
use strict;

my ($file, $edit) = @ARGV;
my $l = Lego::Ldraw->new_from_file($file);

for (@$l) {
  $_->eval($edit);
}

print $l;
