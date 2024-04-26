#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "Usage: $0 <NEW_PASSWORD>"
	exit 1
fi

NEW_PASSWORD="$1"

mysql -u root <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$NEW_PASSWORD';
FLUSH PRIVILEGES;
EOF

echo "MySQL root user password has been updated."

