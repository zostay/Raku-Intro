package main
import "fmt"
func main() {
    i := 0.1
    var t = "False"
    if i + 0.2 == 0.3 {
        t = "True"
    }
    fmt.Println("Go (runtime):", t);
}
