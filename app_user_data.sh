#!/bin/bash

dnf update -y
dnf install -y httpd

systemctl start httpd
systemctl enable httpd

cat <<EOF > /var/www/html/index.html
<html>
<head>
    <title>Application Server</title>
</head>
<body>
    <h1>Application Tier - Highly Available 3-Tier Architecture</h1>
    <p>Application server is running successfully.</p>
</body>
</html>
EOF