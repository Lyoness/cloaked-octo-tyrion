package main

import (
	"fmt"
	"net/http"
	"os"
)

func main() {
	http.HandleFunc(`/`, func(w http.ResponseWriter, req *http.Request) {
		w.WriteHeader(http.StatusOK)
		fmt.Fprintf(w, "source version: %q", os.Getenv("SOURCE_VERSION"))
	})

	http.ListenAndServe(":"+os.Getenv("PORT"), nil)
}
