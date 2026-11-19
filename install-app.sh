#!/bin/bash

dnf update -y

dnf install -y python3

mkdir -p /opt/myapp

cat > /opt/myapp/app.py <<'PY'
from http.server import BaseHTTPRequestHandler, HTTPServer

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        message = b"Application tier is working!"

        self.send_response(200)
        self.send_header("Content-Type", "text/plain")
        self.send_header("Content-Length", str(len(message)))
        self.end_headers()
        self.wfile.write(message)

server = HTTPServer(("0.0.0.0", 8080), Handler)
server.serve_forever()
PY

cat > /etc/systemd/system/myapp.service <<'EOF'
[Unit]
Description=Demo application
After=network.target

[Service]
ExecStart=/usr/bin/python3 /opt/myapp/app.py
Restart=always
User=root

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable --now myapp