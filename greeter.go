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
	fmtStr := fmt.Sprintf("Hello, %s! I'm %s", GetIPFromRequest(r), os.Getenv("HOSTNAME"))
	fmt.Println(fmtStr)
	fmt.Fprintln(w, fmtStr)
}

func GetIPFromRequest(r *http.Request) string {
	if fwd := r.Header.Get("x-forwarded-for"); fwd != "" {
		return fwd
	}

	return r.RemoteAddr
}
