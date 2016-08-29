#!/usr/bin/env perl6
use v6;

use GlotIO;

my %languages =
    pl    => 'perl',
    p6    => 'perl6',
    scala => 'scala',
    rb    => 'ruby',
    py    => 'python',
    java  => 'java',
    c     => 'c',
    rs    => 'rust',
    go    => 'go',
    sh    => 'bash',
    ;

sub MAIN($key, $src = './src') {
    my @dirs = $src.IO;

    my %uploads;

    while @dirs.shift -> $dir {
        for $dir.dir -> $src-file {
            if $src-file.d {
                push @dirs, $src-file;
            }
            elsif $src-file ~~ /'.' $<suffix> = [ \w+ ] $/
               && (%languages{ $<suffix> }:exists) {

                my $lang = %languages{ $<suffix> };

                if $lang eq 'scala' | 'java' {
                    push %uploads{ $dir }{ $lang }, $src-file;
                }
                else {
                    push %uploads{ $src-file }{ $lang }, $src-file;
                }
            }
        }
    }

    my $glot = GlotIO.new(:$key);

    for %uploads.sort».kv -> ($name, %langs) {
        for %langs.sort».kv -> ($lang, @files) {
            my $short-name = $name.subst(/^ .* '/src/' /, '');
            my %res = $glot.create($lang, @files.map({ $_ => .slurp }), $short-name);
            say "Uploaded $short-name ($lang) [%res<id>]: @files[]";
        }
    }
}
