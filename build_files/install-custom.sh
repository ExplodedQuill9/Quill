#!/usr/bin/bash
set -xeuo pipefail

rpm-ostree install --apply-live --id \
    gamescope mangohud proton-ge-custom lutris nvme-cli tuned wayvr || true

curl -L https://github.com/wlx-team/wayvr/releases/latest/download/WayVR-x86_64.AppImage -o /usr/local/bin/WayVR.AppImage
chmod +x /usr/local/bin/WayVR.AppImage

mkdir -p /etc/steamvr
echo '{"steamvr":{"enableGlobalInputFromOverlays":true}}' > /etc/steamvr/steamvr.vrsettings

echo 'vm.swappiness=10' >> /etc/sysctl.d/99-custom.conf
echo 'vm.vfs_cache_pressure=50' >> /etc/sysctl.d/99-custom.conf
tuned-adm profile throughput-performance

rpm-ostree override remove gnome-software --uninstall || true
