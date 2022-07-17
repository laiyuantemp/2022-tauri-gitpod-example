FROM gitpod/workspace-full-vnc
USER root
RUN apt update && \
    apt install -yq build-essential \
        libwebkit2gtk-4.0-dev  \
        build-essential \
        wget \
        libssl-dev \
        libgtk-3-dev \
        libsoup2.4-dev \
        libjavascriptcoregtk-4.0-dev \
        libayatana-appindicator3-dev \
        librsvg2-dev && \
    npm i -g yarn && \
#    cd /workspace/gitpod-test/crates/test-app && yarn && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*
RUN apt install -yq firefox \
    pulseaudio \
    pavucontrol \
    netcat \
    kazam \
    language-pack-zh* \
    language-pack-ja \
    language-pack-ko \
    fonts-arphic-ukai fonts-arphic-uming fonts-ipafont-mincho fonts-ipafont-gothic fonts-unfonts-core \
    ffmpeg
    
FROM gitpod/workspace-full:latest
# optional: use a custom apache config.
COPY apache.conf /etc/apache2/apache2.conf
# optional: change document root folder. It's relative to your git working copy.
ENV APACHE_DOCROOT_IN_REPO="www"

USER gitpod


