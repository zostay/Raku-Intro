constant $lucas     := 2, 1, * + * ... *;
constant $fibonacci := 1, 0, * + * ... *;
constant $φ         := (1 + sqrt 5) / 2;

multi pow-φ(UInt $n) {
    $fibonacci[$n + 1] * $φ + $fibonacci[$n];
}

printf     "%2s %4s %10s %4s %9s\n", 'n', '𝓛', 'φⁿ', 'R()', 'φ()';
for 0..10 -> $n {
    printf "%2d %4d %10f %4d %4dφ + %d\n",
        $n,
        $lucas[$n],
        my $φⁿ = pow-φ($n),
        round($φⁿ),
        $fibonacci[$n + 1],
        $fibonacci[$n],
}


