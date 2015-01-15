# NAME

Dist::Zilla::Plugin::PodnameFromClassname - Insert PODNAME for Moops classes.

# VERSION

Version 0.1002, released 2015-01-15.

# SYNOPSIS

In dist.ini:

    [PodnameFromClassname]

In a [Moops](https://metacpan.org/pod/Moops) class:

    # PODCLASSNAME

    class My::Class { ... }

Results in:

    # PODNAME: My::Class

    class My::Class { ... }

# DESCRIPTION

Dist::Zilla::Plugin::PodnameFromClassname is useful together with [Moops](https://metacpan.org/pod/Moops) and [Pod::Weaver](https://metacpan.org/pod/Pod::Weaver). Since Moops classes generally don't also have a `package` statement `Pod::Weaver` can't pick up the module name.

Using this plugin and adding a `# PODCLASSNAME` directive fixes that. It replaces that directive with `# PODNAME: $classname`.

There are a few simple rules:

- There must be at least one line (of anything) before the `# PODCLASSNAME` directive.
- There must be at least one line (of anything) between the `# PODCLASSNAME` directive and the `class` statement.
- The `# PODCLASSNAME` directive must be before the `class` statement.

# SEE ALSO

- [Dist::Zilla::Plugin::PodnameFromFilename](https://metacpan.org/pod/Dist::Zilla::Plugin::PodnameFromFilename)
- [Dist::Zilla](https://metacpan.org/pod/Dist::Zilla)

# SOURCE

[https://github.com/Csson/p5-Dist-Zilla-Plugin-PodnameFromClassname](https://github.com/Csson/p5-Dist-Zilla-Plugin-PodnameFromClassname)

# HOMEPAGE

[https://metacpan.org/release/Dist-Zilla-Plugin-PodnameFromClassname](https://metacpan.org/release/Dist-Zilla-Plugin-PodnameFromClassname)

# AUTHOR

Erik Carlsson <info@code301.com>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by Erik Carlsson <info@code301.com>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
