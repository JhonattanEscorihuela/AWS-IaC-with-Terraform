#!/bin/bash
yum update -y
yum install -y httpd jq aws-cli

# Espera unos segundos para que la red esté lista
sleep 10

systemctl enable httpd
systemctl start httpd

# Obtener metadatos seguros (IMDSv2)
TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" \
  -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

COMPUTE_INSTANCE_ID=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/instance-id)

COMPUTE_MACHINE_UUID=$(cat /sys/devices/virtual/dmi/id/product_uuid | tr '[:upper:]' '[:lower:]')

# Crear página HTML personalizada
cat <<EOF > /var/www/html/index.html
<html>
  <head><title>My Instance Info</title></head>
  <body>
    <h1>This message was generated on instance $COMPUTE_INSTANCE_ID</h1>
    <p>with the following UUID: $COMPUTE_MACHINE_UUID</p>
  </body>
</html>
EOF

# Reinicia httpd para asegurar que sirva el nuevo index.html
systemctl restart httpd
