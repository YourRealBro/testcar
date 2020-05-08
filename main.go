package main

import (
	"log"
	"net/http"
//	"crypto/subtle"
	sw "./go"
)



func main() {
	log.Printf("Server started")
	router := sw.NewRouter()

	log.Fatal(http.ListenAndServe(":8080", router))
}

