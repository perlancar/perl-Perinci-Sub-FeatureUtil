package Perinci::Sub::FeatureUtil;

use 5.010001;
use strict;
use warnings;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw(
                       declare_function_feature
               );

# VERSION

sub declare_function_feature {
    my %args   = @_;
    my $name   = $args{name}   or die "Please specify feature's name";
    my $schema = $args{schema} or die "Please specify feature's schema";

    $name =~ /\A\w+\z/
        or die "Invalid syntax on feature's name, please use alphanums only";

    require Rinci::Schema;
    # XXX merge first or use Perinci::Object, less fragile
    my $ff = $Rinci::Schema::function->[1]{"[merge+]keys"}{features}
        or die "BUG: Schema structure changed (1)";
    $ff->[1]{keys}
        or die "BUG: Schema structure changed (2)";
    $ff->[1]{keys}{$name}
        and die "Feature '$name' is already declared";
    $ff->[1]{keys}{$name} = $args{schema};
}

1;
# ABSTRACT: Utility routines for Perinci::Sub::Feature::* modules

=head1 SYNOPSIS


=head1 FUNCTIONS

=head2 declare_function_feature


=head1 SEE ALSO

L<Perinci>

Perinci::Sub::Feature::* modules.

=cut
