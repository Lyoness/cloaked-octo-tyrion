package main

import (
	"fmt"
	"os"
)

func main() {
	fmt.Println("ohhaiiii")
	fmt.Printf("%s\n", os.Getenv("TRAVIS_GO_VERSION"))
}
