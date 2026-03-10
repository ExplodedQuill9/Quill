FROM ghcr.io/ublue-os/bazzite-gnome-nvidia:testing-43

COPY build_files/install-custom.sh /tmp/
RUN chmod +x /tmp/install-custom.sh && \
    mkdir -p /var/lib/alternatives && \
    /tmp/install-custom.sh && \
    ostree container commit
