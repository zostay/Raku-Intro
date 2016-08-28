use v6;

say "one" min "two" min "three" min "four";

say [min] "one", "two", "three", "four";

my @list1 = <foo bar baz qux>;
say [min] @list1;

my @list2 = <alice bob charlie dave>;
say @list1 Zmin @list2;

say @list1 Xmin @list2;

say @list1 »~« @list2;

say "X" «~« @list1;
