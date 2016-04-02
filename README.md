# NAME

Dist::Zilla::Plugin::PodnameFromClassname - Insert PODNAME for Moops classes.

<div>
    <p>
    <img src="https://img.shields.io/badge/perl-5.10+-blue.svg" alt="Requires Perl 5.10+" />
    <a href="https://travis-ci.org/Csson/p5-Dist-Zilla-Plugin-PodnameFromClassname"><img src="https://api.travis-ci.org/Csson/p5-Dist-Zilla-Plugin-PodnameFromClassname.svg?branch=master" alt="Travis status" /></a>
    <a href="http://cpants.cpanauthors.org/dist/Dist-Zilla-Plugin-PodnameFromClassname-0.1100"><img src="https://badgedepot.code301.com/badge/kwalitee/Dist-Zilla-Plugin-PodnameFromClassname/0.1100" alt="Distribution kwalitee" /></a>
    <a href="http://matrix.cpantesters.org/?dist=Dist-Zilla-Plugin-PodnameFromClassname%200.1100"><img src="https://badgedepot.code301.com/badge/cpantesters/Dist-Zilla-Plugin-PodnameFromClassname/0.1100" alt="CPAN Testers result" /></a>
    <img src="https://img.shields.io/badge/coverage-81.4%-orange.svg" alt="coverage 81.4%" />
    </p>
</div>

# VERSION

Version 0.1100, released 2016-04-02.

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

Using this plugin and adding a `# PODCLASSNAME` line fixes that (by replacing such a line with the standard `# PODNAME: $classname` comment). There should be only one `# PODCLASSNAME` comment per file.

The plugin picks the first line that starts with `class`, `role`, `namespace` or `library` and uses the package name given on that line.

The comment line should match this regular expression:

    qr/^[\t ]*# PODCLASSNAME:?$/ms

Note: While this plugin was developed with [Moops](https://metacpan.org/pod/Moops) in mind, it should work with any module that introduces any of those keywords.

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

This software is copyright (c) 2016 by Erik Carlsson.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
