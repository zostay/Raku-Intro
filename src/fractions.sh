#!/bin/bash

perl -E 'say "Perl 5: ", -7/3'
docker run -v `pwd`/src/fractions/java:/app -w /app openjdk javac Main.java
docker run -v `pwd`/src/fractions/java:/app -w /app openjdk java Main
python -c 'print "Python:", -7/3'
gcc src/fractions/c/main.c -o src/fractions/c/main
src/fractions/c/main
ruby -e 'puts "Ruby: ", (-7/3).to_s'
php -r 'echo "PHP: ", -7/3, "\n";'
docker run -v `pwd`/src/fractions/rust:/app -w /app schickling/rust rustc -o main main.rs
docker run -v `pwd`/src/fractions/rust:/app -w /app schickling/rust ./main
docker run -v `pwd`/src/fractions/go:/app -w /app golang go build -o main main.go
docker run -v `pwd`/src/fractions/go:/app -w /app golang ./main
docker run -v `pwd`/src/fractions/scala:/app -w /app williamyeh/scala scalac Main.scala
docker run -v `pwd`/src/fractions/scala:/app -w /app williamyeh/scala scala Main
perl6 -e 'say "Perl 6: ", -⁷/₃'

