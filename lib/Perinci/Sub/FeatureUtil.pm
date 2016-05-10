package Perinci::Sub::FeatureUtil;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw(
                       declare_function_feature
               );

sub declare_function_feature {
    my %args   = @_;
    my $name   = $args{name}   or die "Please specify feature's name";
    my $schema = $args{schema} or die "Please specify feature's schema";

    $name =~ /\A\w+\z/
        or die "Invalid syntax on feature's name, please use alphanums only";

    require Sah::Schema::rinci::function_meta;

    my $sch = $Sah::Schema::rinci::function_meta::schema;
    my $props = $sch->[1]{_prop}
        or die "BUG: Schema structure changed (1a)";
    $props->{features}{_keys}{$name}
        and die "Feature property '$name' already defined in schema";
    $props->{features}{_keys}{$name} = {};
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
