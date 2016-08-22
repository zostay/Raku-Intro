# Introduction to Perl 6
Or Why are people so excited?

Sterling Hanenkamp, ZipRecruiter.com

Special Thanks to Curtis "Ovid" Poe.

# TODO

Add JavaScript examples
Add Haskell examples

# Examples to follow along

See glot.io if you want to try these out in a web browser.

# PSA

Perl 6 is not the next version of Perl 5. 

The next version of Perl 5 will be Perl 5.26.

cf. C# and Java

# Same Principles

open slides/timtoady.html

TIMTOWTDI BSCINABTE

There Is More Than One Way To Do It

But Sometimes Consistency Is Not A Bad Thing Either

The Perl community is an odd bunch, and I say that with great affection: punny,
passionate, inclusive, international, and postmodern. This is reflected in our
language design.

# Envy

Perl 6 has cool things.

No other language has may of these things.

Things are well backed. (Not like AOP.)

Perl 6 has been in the works for 15 years.

# Demo

open slides/stfl30.html

# Floating Point Comparison

open slides/floating-point-comparison.html

clear; vimcat src/floating-point-comparison/ruby/main.rb

ruby src/floating-point-comparison/ruby/main.rb

bash src/floating-point-comparison.sh

# Rational Math

clear; vimcat src/rational-math.p6

perl6 src/rational-math.p6

# Try -7/3

open slides/fractions.html

bash src/fractions.sh

clear; vimcat src/nude-fractions.p6

perl6 src/nude-fractions.p6

# Write Only Language

clear; vimcat src/sigils.p6

perl6 src/sigils.p6

# Functions and Functional Programming

open slides/lucas-numbers.html

clear; vimcat src/lucas-numbers/lucas-01.p6

perl6 src/lucas-numbers/lucas-01.p6

clear; vimcat src/lucas-numbers/lucas-02.p6

perl6 src/lucas-numbers/lucas-02.p6

clear; vimcat src/lucas-numbers/lucas-03.p6

perl6 src/lucas-numbers/lucas-03.p6

clear; vimcat src/lucas-numbers/lucas-04.p6

perl6 src/lucas-numbers/lucas-04.p6

clear; vimcat src/lucas-numbers/lucas-05.p6

perl6 src/lucas-numbers/lucas-05.p6

clear; vimcat src/lucas-numbers/lucas-06.p6

perl6 src/lucas-numbers/lucas-06.p6

clear; vimcat src/lucas-numbers/lucas-07.p6

perl6 src/lucas-numbers/lucas-07.p6

clear; vimcat src/lucas-numbers/lucas-08.p6

perl6 src/lucas-numbers/lucas-08.p6

clear; vimcat src/lucas-numbers/lucas-09.p6

perl6 src/lucas-numbers/lucas-09.p6

clear; vimcat src/lucas-numbers/lucas-10.p6

perl6 src/lucas-numbers/lucas-10.p6

# Classes and Declarative Programming 

clear; vimcat src/geopoint/GeoPoint-01.p6

perl6 src/geopoint/GeoPoint-01.p6

clear; vimcat src/geopoint/GeoPoint-02.p6

perl6 src/geopoint/GeoPoint-02.p6

clear; vimcat src/geopoint/GeoPoint-03.p6

perl6 src/geopoint/GeoPoint-03.p6

clear; vimcat src/geopoint/GeoPoint-04.p6

perl6 src/geopoint/GeoPoint-04.p6

clear; vimcat src/geopoint/GeoPoint-05.p6

perl6 src/geopoint/GeoPoint-05.p6

clear; vimcat src/geopoint/GeoPoint-06.p6

perl6 src/geopoint/GeoPoint-06.p6

TODO Compare to other langauges here?

# Regexes and Grammars



# Unicode

clear; vimcat src/unicode.pl

perl src/unicode.pl

perl6 src/show-unicode.p6 src/unicode.pl

clear; vimcat src/unicode.p6

perl6 src/show-unicode.p6 src/unicode.p6

perl6 src/unicode.p6

# Parallel Programming

clear; vimcat src/serial-programming.p6

time perl6 src/serial-programming.p6

clear; vimcat src/serial-programming.p6; perl6 -e 'say "\n", "-" x 80, "\n"'; vimcat src/parallel-programming.p6

time perl6 src/parallel-programming.p6

clear; vimcat src/chat-server.p6

perl6 src/chat-server.p6

# There's an Operator for that

clear; vimcat src/operators-divisible.p6

perl6 src/operators-divisible.p6

clear; vimcat src/operators-op-equals.p6

perl6 src/operators-op-equals.p6

clear; vimcat src/operators-meta.p6

perl6 src/operators-meta.p6

# Useful built-in methods

clear; vimcat src/builtins.p6

perl6 src/builtins.p6

