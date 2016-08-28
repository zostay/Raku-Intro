use v6;

my @primes = (0^..*).grep(*.is-prime).lazy;
say @primes[^10];

my @list = <one two three>;
say @list.combinations;
say @list.permutations;

say @list.pick(*);
say @list.pick;

say expmod(7, 2, 5); # 7 ** 2 % 5;
