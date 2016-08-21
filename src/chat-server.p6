use v6;

class User {
    has $.name is rw = 'Anonymous';
    has $.conn is required;
}

my @connections;

note "Listening on port 3456...";

react {
    whenever IO::Socket::Async.listen('localhost', 3456) -> $conn {
        my $user = User.new(:$conn);
        push @connections, $user;

        whenever $conn.Supply.lines -> $line {
            given $line {
                when /^ "LOGIN " / {
                    $user.name = .substr(6);
                    say "Login by ", $user.name;
                    @connections.race.map: {
                        .conn.print("ENTER {$user.name}\n")
                    }
                }
                when "QUIT" {
                    @connections .= grep: * !=== $user;
                    @connections.race.map: {
                        .conn.print("LEAVE {$user.name}\n")
                    }
                    $conn.close;
                }
                default {
                    my $msg-line = [~] $user.name, ": ", $line;
                    say $msg-line;
                    @connections.race.map: {
                        .conn.print("$msg-line\n");
                    }
                }
            }
        }
    }
}
