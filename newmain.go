package main

import (
	"log"
	"net/http"
	"crypto/subtle"
	sw "./go"
)

//func BasicAuth(handler http.HandlerFunc, username, password, realm string) http.HandlerFunc {
func BasicAuth(username, password, realm string) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
			user, pass, ok := r.BasicAuth()
			if !ok || subtle.ConstantTimeCompare([]byte(user), []byte(username)) != 1 || subtle.ConstantTimeCompare([]byte(pass), []byte(password)) != 1 {
					w.Header().Set("WWW-Authenticate\n", `Basic realm="`+realm+`"`)
					w.WriteHeader(401)
					w.Write([]byte("Unauthorised.\n"))
					return
			}
			handler(w, r)
	}
}

func main() {
	log.Printf("Server started")
	router := sw.NewRouter()

//	http.HandleFunc("/", BasicAuth(handleIndex, "admin", "123456", "Please enter your username and password for this site"))
	http.HandleFunc("/", BasicAuth("admin", "123456", "Please enter your username and password for this site"))

	log.Fatal(http.ListenAndServe(":8080", router))
}
