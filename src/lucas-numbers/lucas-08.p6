multi lucas(0) returns UInt { 2 }
multi lucas(1) returns UInt { 1 }
multi lucas(UInt $nth) returns UInt {
    lucas($nth - 1) + lucas($nth - 2)
}

say lucas(10);
