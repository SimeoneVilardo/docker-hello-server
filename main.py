import os
from http.server import BaseHTTPRequestHandler, HTTPServer

class RequestHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-Type", "text/plain")
        self.end_headers()
        self.wfile.write(b"Hello Server")
    
    def log_message(self, format, *args):
        return

def run(server_class=HTTPServer, handler_class=RequestHandler):
    port = int(os.getenv("PORT", 8000))
    server_address = ('', port)
    server = server_class(server_address, handler_class)
    print("Server (Python) started", flush=True)
    server.serve_forever()

if __name__ == "__main__":
    run()
