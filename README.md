# UFW Firewall Configuration Script for Local Services (PostgreSQL, Cassandra, Kafka, Zookeeper)

This script configures UFW (Uncomplicated Firewall) to allow access to critical backend services (PostgreSQL, Cassandra, Kafka, Zookeeper) **only** from a specified trusted IP address.

It ensures that your internal services are not exposed publicly while allowing necessary communication within a trusted network (e.g., server clusters, VPNs).

---

## ✨ What the script does

- Accepts a **server or trusted network IP** as a variable.
- Opens essential service ports only **for the specified IP**.
- Keeps all services **protected from public access**.
- Displays the updated UFW firewall rules after applying changes.

---

## 🚀 How to use

1. Save the script:

    ```bash
    nano setup-ufw-local-services.sh
    ```

2. Replace the placeholder `YOUR_SERVER_IP_HERE` with your server or trusted network IP:

    ```bash
    SERVER_IP="192.168.1.10"
    ```

3. Make the script executable:

    ```bash
    chmod +x setup-ufw-local-services.sh
    ```

4. Run the script:

    ```bash
    ./setup-ufw-local-services.sh
    ```

---

## 🔥 Ports opened by this script

| Service | Port | Protocol | Access Scope |
|:---|:---|:---|:---|
| PostgreSQL | 5432/tcp | TCP | Allowed only from trusted IP |
| Cassandra CQL | 9042/tcp | TCP | Allowed only from trusted IP |
| Cassandra Gossip communication | 7000/tcp, 7001/tcp | TCP | Allowed only from trusted IP |
| Cassandra JMX Monitoring | 7199/tcp | TCP | Allowed only from trusted IP |
| Zookeeper | 2181/tcp | TCP | Allowed only from trusted IP |
| Kafka Broker | 9092/tcp | TCP | Allowed only from trusted IP |
| Kafka Internal Replication (optional) | 9093/tcp, 9094/tcp | TCP | Allowed only from trusted IP |

---

## 📋 Important Notes

- **Set the correct IP address** (`SERVER_IP`) before running the script.
- This script assumes a standard ThingsBoard PE stack configuration.
- It is highly recommended to keep internal services accessible only within private networks or VPNs.
- Remember to also configure UFW to allow administrative SSH access (`22/tcp`).

---

## 🛡️ Author

Inteliv - Automatyka Budynkowa
