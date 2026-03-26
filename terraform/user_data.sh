#!/bin/bash

# Update system packages
apt-get update
apt-get upgrade -y

# Install basic utilities
apt-get install -y curl wget git unzip

# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
systemctl start docker
systemctl enable docker

# Install Docker Compose
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Create application directory
mkdir -p /opt/axionvera-dashboard
cd /opt/axionvera-dashboard

# Clone the repository (this would be done manually or via CI/CD)
# git clone https://github.com/akordavid373/axionvera-dashboard.git .

# Create a basic nginx configuration for reverse proxy
cat > /etc/nginx/sites-available/axionvera-dashboard << 'EOF'
server {
    listen 80;
    server_name _;

    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_cache_bypass $http_upgrade;
    }
}
EOF

# Enable the site
ln -s /etc/nginx/sites-available/axionvera-dashboard /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default

# Install and start nginx
apt-get install -y nginx
systemctl start nginx
systemctl enable nginx

# Create a startup script for the application
cat > /opt/start-app.sh << 'EOF'
#!/bin/bash
cd /opt/axionvera-dashboard
docker-compose up -d
EOF

chmod +x /opt/start-app.sh

# Add to crontab for auto-start on reboot
(crontab -l 2>/dev/null; echo "@reboot /opt/start-app.sh") | crontab -

echo "Infrastructure setup completed for ${ENVIRONMENT}"
echo "Next steps:"
echo "1. Deploy application code to /opt/axionvera-dashboard"
echo "2. Configure environment variables"
echo "3. Run: docker-compose up -d"
