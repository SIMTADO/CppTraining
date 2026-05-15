# .devcontainer/Dockerfile
# ============================================================================
# Image de développement C++23 — Ubuntu 24.04
# ============================================================================

FROM ubuntu:24.04

# Éviter les prompts interactifs pendant l'installation
ENV DEBIAN_FRONTEND=noninteractive

# --- Outils de base ---
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gdb \
    cmake \
    ninja-build \
    ccache \
    git \
    curl \
    wget \
    ca-certificates \
    pkg-config \
    python3 \
    python3-pip \
    gnupg \
    lsb-release \
    sudo \
    locales \
    && rm -rf /var/lib/apt/lists/*

# --- Locale UTF-8 ---
RUN locale-gen en_US.UTF-8  
ENV LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8  

# --- GCC 15 ---
RUN apt-get update && apt-get install -y --no-install-recommends \
    software-properties-common \
    && add-apt-repository ppa:ubuntu-toolchain-r/test -y \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
    gcc-15 g++-15 \
    && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-15 100 \
    && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-15 100 \
    && rm -rf /var/lib/apt/lists/*

# --- Clang 20 + clangd + clang-tidy + clang-format ---
RUN wget -qO- https://apt.llvm.org/llvm.sh | bash -s -- 20 all \
    && update-alternatives --install /usr/bin/clang clang /usr/bin/clang-20 100 \
    && update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-20 100 \
    && update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-20 100 \
    && update-alternatives --install /usr/bin/clang-format clang-format \
       /usr/bin/clang-format-20 100 \
    && update-alternatives --install /usr/bin/clang-tidy clang-tidy \
       /usr/bin/clang-tidy-20 100 \
    && rm -rf /var/lib/apt/lists/*

# --- CMake récent (si la version Ubuntu est trop ancienne) ---
# Décommentez si nécessaire :
# RUN pip3 install --break-system-packages cmake --upgrade

# --- Dépendances projet (adapter selon votre projet) ---
# RUN apt-get update && apt-get install -y --no-install-recommends \
#     libfmt-dev \
#     libssl-dev \
#     nlohmann-json3-dev \
#     && rm -rf /var/lib/apt/lists/*

# --- Utilisateur non-root ---
ARG USERNAME=vscode  
ARG USER_UID=1000  
ARG USER_GID=$USER_UID  

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo "$USERNAME ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# --- Configuration ccache pour l'utilisateur ---
RUN mkdir -p /home/$USERNAME/.cache/ccache \
    && chown -R $USERNAME:$USERNAME /home/$USERNAME/.cache

USER $USERNAME

# --- ccache dans le PATH ---
ENV PATH="/usr/lib/ccache:${PATH}"

# Vérifications
RUN echo "=== Toolchain ===" \
    && g++ --version | head -1 \
    && clang++ --version | head -1 \
    && cmake --version | head -1 \
    && ninja --version \
    && gdb --version | head -1 \
    && clangd --version | head -1 \
    && ccache --version | head -1