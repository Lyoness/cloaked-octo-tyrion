package main

import (
	"fmt"
	"os"
	"time"
)

func main() {
	fmt.Println("ohhai™ %s", time.Now().UTC())
	fmt.Println(os.Getenv("TRAVIS_GO_VERSION"))
	fmt.Println(os.Getenv("HAI"))
}
