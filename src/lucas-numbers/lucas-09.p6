# 𝓛 - MATHEMATICAL BOLD SCRIPT CAPITAL L
multi postfix:<𝓛>(0) returns UInt { 2 }
multi postfix:<𝓛>(1) returns UInt { 1 }
multi postfix:<𝓛>(UInt $nth) returns UInt {
    ($nth - 1)𝓛 + ($nth - 2)𝓛
}

say 12𝓛;
