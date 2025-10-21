#!/bin/bash
# 1️⃣ Update system packages / Actualizar paquetes
yum update -y

# 2️⃣ Install utilities / Instalar utilidades
yum install -y httpd jq aws-cli

# 3️⃣ Enable & start web server / Habilitar y arrancar servidor web
systemctl enable httpd
systemctl start httpd

# 4️⃣ Get metadata using IMDSv2 / Obtener metadatos seguros
TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" \
  -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

INSTANCE_ID=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/instance-id)

PRIVATE_IP=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/local-ipv4)

# 5️⃣ Create custom HTML page / Crear página HTML personalizada
cat <<EOF > /var/www/html/index.html
<html>
  <head><title>My Instance Info</title></head>
  <body>
    <h1>This message was generated on instance $INSTANCE_ID</h1>
    <h2>Welcome to Green Environment</h2>
    <p>With the following IP: $PRIVATE_IP</p>
  </body>
</html>
EOF