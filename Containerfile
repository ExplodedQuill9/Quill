# Use a more specific tag for reproducibility (check https://github.com/orgs/ublue-os/packages/container/package/bazzite-gnome-nvidia
# for the newest testing-43.yyyymmdd[.n] tag as of your build date)
FROM ghcr.io/ublue-os/bazzite-gnome-nvidia:testing-43.20260312

# Optional: set working directory (helps readability)
WORKDIR /tmp

# Copy script and make it executable in one step
COPY --chmod=755 build_files/install-custom.sh install-custom.sh

# Create alternatives dir if your script uses update-alternatives
RUN mkdir -p /var/lib/alternatives && \
    ./install-custom.sh && \
    ostree container commit
