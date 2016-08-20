#!/bin/bash

perl -E 'say "Perl 5: ", 0.1 + 0.2 == 0.3 ? "True" : "False"'
docker run -v `pwd`/src/floating-point-comparison/java:/app -w /app openjdk javac Main.java
docker run -v `pwd`/src/floating-point-comparison/java:/app -w /app openjdk java Main
python -c 'print "Python:", "True" if 0.1 + 0.2 == 0.3 else "False"'
gcc src/floating-point-comparison/c/main.c -o src/floating-point-comparison/c/main
src/floating-point-comparison/c/main
ruby -e 'puts "Ruby: " + (0.1 + 0.2 == 0.3 ? "True" : "False")'
php -r 'echo "PHP: ", 0.1 + 0.2 == 0.3 ? "True" : "False", "\n";'
docker run -v `pwd`/src/floating-point-comparison/rust:/app -w /app schickling/rust rustc -o main main.rs
docker run -v `pwd`/src/floating-point-comparison/rust:/app -w /app schickling/rust ./main
docker run -v `pwd`/src/floating-point-comparison/go:/app -w /app golang go build -o main main.go
docker run -v `pwd`/src/floating-point-comparison/go:/app -w /app golang ./main
docker run -v `pwd`/src/floating-point-comparison/go:/app -w /app golang go build -o main2 main2.go
docker run -v `pwd`/src/floating-point-comparison/go:/app -w /app golang ./main2
docker run -v `pwd`/src/floating-point-comparison/scala:/app -w /app williamyeh/scala scalac Main.scala
docker run -v `pwd`/src/floating-point-comparison/scala:/app -w /app williamyeh/scala scala Main
perl6 -e 'say "Perl 6: ", 0.1 + 0.2 == 0.3 ?? "True" !! "False"'
