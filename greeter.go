package main

import (
	"fmt"
	"net/http"
	"os"

	"github.com/google/uuid"
)

func main() {
	// Generate a unique tag
	uniqueTag := uuid.New().String()

	// Set the HELLO_TAG environment variable to the generated unique tag
	os.Setenv("HELLO_TAG", uniqueTag)

	fmt.Println("Hivemind's Go Greeter")
	fmt.Println("You are running the service with this tag: ", uniqueTag)
	http.HandleFunc("/", HelloServer)
	http.ListenAndServe(":8080", nil)
}

func HelloServer(w http.ResponseWriter, r *http.Request) {
	name := r.URL.Query().Get("name")
	if name == "" {
		name = "Guest"
	}

	fmtStr := fmt.Sprintf("Hello, %s! I'm %s", name, os.Getenv("HOSTNAME"))
	fmt.Println(fmtStr)
	fmt.Fprintln(w, fmtStr)
}
