#!/bin/bash

# Step 1: Download the latest release of node_exporter
curl -sL -o node_exporter.tar.gz $(curl -s https://api.github.com/repos/prometheus/node_exporter/releases/latest | grep -E "browser_download_url.*linux-amd64.tar.gz" | cut -d : -f 2,3 | tr -d \")

# Step 2: Extract and move the node_exporter binary
tar xvf node_exporter.tar.gz
cd node_exporter-*
sudo cp node_exporter /usr/local/bin

# Step 3: Create a system user for node_exporter
sudo useradd --no-create-home --shell /bin/false node_exporter

# Step 4: Set ownership and permissions for the node_exporter binary
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter

# Step 5: Create a systemd service for node_exporter
sudo tee /etc/systemd/system/node_exporter.service > /dev/null <<EOT
[Unit]
Description=Prometheus Node Exporter
Documentation=https://github.com/prometheus/node_exporter
After=network.target

[Service]
User=node_exporter
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=default.target
EOT

# Step 6: Enable and start the node_exporter service
sudo systemctl daemon-reload
sudo systemctl enable node_exporter
sudo systemctl start node_exporter

# Step 7: Verify the status of the node_exporter service
sudo systemctl status node_exporter
