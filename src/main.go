package main

import (
	"fmt"
	"log"
	"math/rand/v2"
	"net/http"
	"os"
)

func main() {
	foo := os.Getenv("FOO")
	serverRandom := rand.IntN(1000)
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte(fmt.Sprintf("Server Random: %d, FOO=%s", serverRandom, foo)))
		w.WriteHeader(http.StatusOK)
	})
	log.Println("serving https server...")
	http.ListenAndServe(":80", nil)
}
