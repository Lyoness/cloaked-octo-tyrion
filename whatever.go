package main

import (
	"fmt"
	"os"
)

func main() {
	fmt.Println("ohhai™")
	fmt.Println(os.Getenv("TRAVIS_GO_VERSION"))
	fmt.Println(os.Getenv("HAI"))
}
