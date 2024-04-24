#!/bin/bash

# Check if $1 is a value, else exit script
if [ -z "$1" ];
then
	echo "Update called without a value. Nothing has changed. Exiting..."
fi

# Update root user's account password
mysql -u root << EOF
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$NEW_PASSWORD';
FLUSH PRIVILEGES;
EOF

echo "MySQL root user password has been updated."
