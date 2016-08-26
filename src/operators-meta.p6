use v6;

say "one" ~ "two" ~ "three" ~ "four";

say [~] "one", "two", "three", "four";

my @list1 = <one two three four>;
say [~] @list1;

my @list2 = <alice bob charlie dave>;
say @list1 Z~ @list2;

say @list1 X~ @list2;

say @list1 »~« @list2;

say "X" «~« @list1;
