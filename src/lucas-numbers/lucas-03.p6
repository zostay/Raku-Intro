sub lucas(Int $nth) returns Int {
    given $nth {
        when 0 { 2 }
        when 1 { 1 }
        default { lucas($nth - 1) + lucas($nth - 2) }
    }
}

say lucas(3.7);
