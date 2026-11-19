
#!/bin/bash
set -euxo pipefail

# Update Amazon Linux 2 packages
yum update -y

# Install Apache
yum install -y httpd

# Create the homepage
cat > /var/www/html/index.html <<'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>HA 3-Tier Architecture</title>
</head>
<body>
    <h1>Welcome to HA 3-Tier Architecture</h1>
    <p>Web Server is Running Successfully!</p>
</body>
</html>
EOF

# Enable and start Apache
systemctl enable httpd
systemctl start httpd

# Verify Apache
systemctl status httpd --no-pager
