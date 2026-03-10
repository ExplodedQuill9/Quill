FROM ghcr.io/ublue-os/bazzite-gnome-nvidia:stable

COPY build_files/install-custom.sh /tmp/
RUN mkdir -p /var/lib/alternatives && \
    /tmp/install-custom.sh && \
    ostree container commit
    
### LINTING
## Verify final image and contents are correct.
RUN bootc container lint
