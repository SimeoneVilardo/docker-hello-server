package main

import (
    "fmt"
    "net/http"
    "os"
)

func handler(w http.ResponseWriter, r *http.Request) {
    w.Header().Set("Content-Type", "text/plain")
    fmt.Fprintln(w, "Hello Server")
}

func main() {
    port := os.Getenv("PORT")
    if port == "" {
        port = "8000"
    }

    addr := fmt.Sprintf(":%s", port)
    
    http.HandleFunc("/", handler)
    fmt.Printf("Server (Go) started\n", port)
    if err := http.ListenAndServe(addr, nil); err != nil {
        fmt.Println("Server failed:", err)
    }
}
