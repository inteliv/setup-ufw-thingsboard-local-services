#!/bin/bash

# IP address of the server (or trusted network)
# Example: 192.168.1.10
SERVER_IP="YOUR_SERVER_IP_HERE"

echo "🔒 Configuring UFW rules for local services (PostgreSQL, Cassandra, Kafka, Zookeeper)..."
echo "➡️  Allowing only from IP: $SERVER_IP"

# PostgreSQL (port 5432)
echo "➡️  Allowing PostgreSQL on port 5432/tcp from $SERVER_IP"
sudo ufw allow from $SERVER_IP to any port 5432 proto tcp

# Cassandra CQL (port 9042)
echo "➡️  Allowing Cassandra CQL on port 9042/tcp from $SERVER_IP"
sudo ufw allow from $SERVER_IP to any port 9042 proto tcp

# Cassandra Gossip communication (ports 7000 and 7001)
echo "➡️  Allowing Cassandra Gossip on ports 7000/tcp and 7001/tcp from $SERVER_IP"
sudo ufw allow from $SERVER_IP to any port 7000 proto tcp
sudo ufw allow from $SERVER_IP to any port 7001 proto tcp

# Cassandra JMX monitoring (port 7199)
echo "➡️  Allowing Cassandra JMX on port 7199/tcp from $SERVER_IP"
sudo ufw allow from $SERVER_IP to any port 7199 proto tcp

# Zookeeper (port 2181)
echo "➡️  Allowing Zookeeper on port 2181/tcp from $SERVER_IP"
sudo ufw allow from $SERVER_IP to any port 2181 proto tcp

# Kafka Broker (port 9092)
echo "➡️  Allowing Kafka Broker on port 9092/tcp from $SERVER_IP"
sudo ufw allow from $SERVER_IP to any port 9092 proto tcp

# Kafka internal replication ports (optional, only if needed)
echo "➡️  Allowing Kafka internal replication on ports 9093/tcp and 9094/tcp from $SERVER_IP"
sudo ufw allow from $SERVER_IP to any port 9093 proto tcp
sudo ufw allow from $SERVER_IP to any port 9094 proto tcp

# Display updated UFW status
echo "✅ Current UFW status:"
sudo ufw status verbose

echo "🎯 Local service firewall rules applied successfully!"
