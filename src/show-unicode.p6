sub uplus($c) { sprintf "<U+%04X;%s>", $c, $c.chr.uniname }
sub MAIN($file) {
    my $cp;
    my $bytes = 0;
    say [~] gather for $file.IO.slurp(:bin) {
        when so $bytes   { $bytes--; $cp = ($cp +< 6) +| ($_ +& 0x3F) }
        when so $cp      { take uplus($cp); $cp = Nil }
        when 0x0A        { take .chr }
        when ^0x20       { take uplus($_) }
        when 0x20..^0x7F { take .chr }
        when 0x80..^0xE0 { $cp = $_ +& 0x1F; $bytes = 1 }
        when 0xE0..^0xF0 { $cp = $_ +& 0x0F; $bytes = 2 }
        when 0xF0..^0xF8 { $cp = $_ +& 0x07; $bytes = 3 }
        when 0xF8..^0xFC { $cp = $_ +& 0x03; $bytes = 4 }
        when 0xFC..^0xFE { $cp = $_ +& 0x01; $bytes = 5 }
    }
}
