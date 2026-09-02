# Kali Linux container for authorized security testing / research.
FROM kalilinux/kali-rolling

ARG DEBIAN_FRONTEND=noninteractive

# Base toolset. Swap kali-linux-headless for kali-linux-default (or a
# smaller custom package list) depending on how much of the Kali
# metapackage you actually need.
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        kali-linux-headless \
        sudo \
        openssh-client \
        vim \
        less \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Non-root user with sudo, so the container isn't run as root by default.
ARG USERNAME=kali
RUN useradd --create-home --shell /bin/bash "${USERNAME}" \
    && echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/"${USERNAME}" \
    && chmod 0440 /etc/sudoers.d/"${USERNAME}"

USER ${USERNAME}
WORKDIR /home/${USERNAME}

CMD ["/bin/bash"]
