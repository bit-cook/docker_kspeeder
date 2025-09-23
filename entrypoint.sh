#!/bin/sh
set -e

write_mirrors_config() {
    local filename="$1"
    cat > "$filename" << 'EOF'
mirrors:
  - url: "https://docker.1ms.run"
  - url: "https://docker.m.daocloud.io"
  - url: "https://docker.m.ixdev.cn"
  - url: "https://dockerproxy.net"
  - url: "https://image.cloudlayer.icu"
  - url: "https://docker.13140521.xyz"
  - url: "https://docker.1panel.live"
  - url: "https://docker.anye.in"
  - url: "https://docker.amingg.com"
  - url: "https://hub.rat.dev"
EOF
}

CONFIG_DIR="${KSPEEDER_CONFIG:-/kspeeder-config}"
CONFIG_FILE="${CONFIG_DIR}/kspeeder.yml"

if [ ! -f "$CONFIG_FILE" ]; then
  mkdir -p "${CONFIG_DIR}"
  write_mirrors_config "$CONFIG_FILE"
fi

exec /usr/bin/kspeeder
