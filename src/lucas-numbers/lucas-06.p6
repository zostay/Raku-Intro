subset NonNegativeInt of Int where * >= 0;
sub lucas(NonNegativeInt $nth) returns NonNegativeInt {
    given $nth {
        when 0 { 2 }
        when 1 { 1 }
        default { lucas($nth - 1) + lucas($nth - 2) }
    }
}

say lucas(8);
