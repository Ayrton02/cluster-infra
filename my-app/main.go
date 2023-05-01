package main

import (
	"encoding/json"
	"fmt"
	"math/rand"
	"net/http"

	"os/exec"

	"github.com/gorilla/mux"
)

type Status struct {
	Name string
	Ip   string
}

func main() {
	router := mux.NewRouter()
	router.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		randomNumber := rand.Intn(1000000000)
		accumulator := 0

		for i := 0; i < randomNumber; i++ {
			if accumulator > randomNumber {
				break
			}
			if i%2 == 0 {
				accumulator = accumulator + 2
			}

			if i%2 < 0 {
				accumulator = accumulator + 1
			}
		}

		w.WriteHeader(200)
		res := fmt.Sprintf(`{"status": "ok", "randomNumber": "%d"}`, randomNumber)
		json.NewEncoder(w).Encode(res)
	})
	router.HandleFunc("/health", Heartbeat)
	http.ListenAndServe(":8080", router)
}

func Heartbeat(w http.ResponseWriter, r *http.Request) {
	cmd := exec.Command("hostname", "-i")
	stdout, _ := cmd.Output()
	ip := string(stdout)

	status := Status{
		Name: "My app",
		Ip:   ip,
	}
	res, _ := json.Marshal(status)
	w.Write(res)
}
