
FROM quay.io/toolbx-images/debian-toolbox:13

LABEL com.github.containers.toolbox="true"

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  curl \
  git \
  cmake \
  ninja-build \
  make \
  gperf \
  ccache \
  dfu-util \
  device-tree-compiler \
  wget \
  python3-dev \
  python3-venv \
  python3-tk \
  xz-utils \
  file \
  gcc gcc-multilib g++-multilib \
  libsdl2-dev \
  libmagic1 \
  vim \
  fish \
  usbutils \
  pciutils \
  pkg-config && \
  rm -rf /var/lib/apt/lists/*

RUN apt clean
RUN apt autoremove

RUN curl https://files.nordicsemi.com/artifactory/swtools/external/nrfutil/executables/x86_64-unknown-linux-gnu/nrfutil -o /usr/bin/nrfutil

RUN chmod a+x /usr/bin/nrfutil

RUN mkdir -p /opt/nrfutil
ENV NRFUTIL_HOME="/opt/nrfutil"
RUN nrfutil self-upgrade
RUN nrfutil install device
RUN nrfutil install sdk-manager
RUN nrfutil install mcu-manager
RUN nrfutil install completion
RUN nrfutil install ble-sniffer

RUN chmod a+rw -R /opt/nrfutil

COPY JLink_Linux_*_x86_64.tgz /opt
RUN mkdir -p /opt/SEGGER/JLink
RUN tar xzf /opt/JLink_Linux_*_x86_64.tgz -C /opt/SEGGER/JLink --strip-components=1
RUN rm /opt/JLink_Linux_*_x86_64.tgz
RUN rm /opt/SEGGER/JLink/libjlinkarm*x86*

COPY --chmod=0644 <<'EOF' /etc/profile.d/nrfutil.sh
export NRFUTIL_HOME="/opt/nrfutil"
export PATH="/opt/SEGGER/JLink:$PATH"
EOF

COPY --chmod=0644 <<'EOF' /etc/ld.so.conf.d/seggerlibs.conf
/opt/SEGGER/JLink
EOF

COPY --chmod=0644 <<'EOF' /etc/profile.d/alias.sh
alias ll="ls -la"
EOF


