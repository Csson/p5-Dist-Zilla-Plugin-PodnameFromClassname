use 5.10.1;

# VERSION
# ABSTRACT: Insert PODNAME for Moops classes.

package Dist::Zilla::Plugin::PodnameFromClassname;

use Moose;
with ('Dist::Zilla::Role::FileMunger', 'Dist::Zilla::Role::FileFinderUser' => { default_finders => [':InstallModules']});

sub munge_files {
    my $self = shift;
    $self->munge_file($_) for @{ $self->found_files };
}

sub munge_file {
    my $self = shift;
    my $file = shift;
    my $content = $file->content;
    if($content !~ m{\v\h*#\h+PODCLASSNAME:?\h*\v.*?\v\h*(?:(?:class)|(?:library)|(?:namespace)|(?:role)) +([a-zA-Z][a-zA-Z0-9_]*(?:::[a-zA-Z][a-zA-Z0-9_]*)*)}ms) {
        $self->log_debug(["Skipping %s, no # PODCLASSNAME directive found", $file->name]);
        return;
    }

    my $classname = $1;

    $content =~ s{(\v\h*)(#\h+PODCLASSNAME:?)(?=\h*\v)}{$1# PODNAME: $classname};
    $self->log(["Inserting podname for $classname"]);
    $file->content($content);
}

1;

__END__

=pod

=head1 SYNOPSIS

In dist.ini:

    [PodnameFromClassname]

In a L<Moops> class:

    # PODCLASSNAME

    class My::Class { ... }

Results in:

    # PODNAME: My::Class

    class My::Class { ... }

=head1 DESCRIPTION

Dist::Zilla::Plugin::PodnameFromClassname is useful together with L<Moops> and L<Pod::Weaver>. Since Moops classes generally don't have a C<package> statement C<Pod::Weaver> can't pick up the module name.

Using this plugin, and adding a C<#PODCLASSNAME> directive fixes that by replacing that directive with C<#PODNAME: $classname>.

There are a few simple rules:

=for :list
* There must be at least one line (of anything) before the C<#PODCLASSNAME> directive.
* There must be at least one line (of anything) between the C<#PODCLASSNAME> directive and the C<class> statement.
* The C<#PODCLASSNAME> directive must be before the C<class> statement.

=head1 SEE ALSO

=for :list
* L<Dist::Zilla::Plugin::PodnameFromFilename>
* L<Dist::Zilla>

=cut
