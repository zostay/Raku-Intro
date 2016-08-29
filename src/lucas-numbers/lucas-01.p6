sub lucas($nth) {
    given $nth {
        when 0 { 2 }
        when 1 { 1 }
        default { lucas($nth - 1) + lucas($nth - 2) }
    }
}

for 0 .. 9 -> $n { say lucas($n) }
