package main
import "fmt"
func main() {
    var t = "False"
    if 0.1 + 0.2 == 0.3 {
        t = "True"
    }
    fmt.Println("Go:", t);
}
