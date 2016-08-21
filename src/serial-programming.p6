my @nths = 4000 + (1 .. 4);
my @primes = gather for @nths -> $n {
    take (1 .. *).grep(*.is-prime)[$n];
}
.say for @primes;
