# 🛠️ SCC – Simple Custom Commands

**SCC** is a modular, system-wide shell command enhancer designed for DevOps engineers, SREs, and power users. It provides prebuilt, categorized Bash command extensions for tools such as Docker, Git, tmux, Kubernetes, and more — all maintained cleanly under `/etc/scc`.

---

## 🚀 Features

- 🔹 Organized CLI shortcuts for:
  - Docker & Docker Compose
  - Git
  - tmux
  - Kubernetes (with Minikube)
- 🔹 Fully modular and extensible shell sourcing system
- 🔹 Centralized in `/etc/scc`, loaded via `.sources`
- 🔹 Injects only once into `/etc/bash.bashrc` (no duplication)
- 🔹 Safe, idempotent installation via Git or one-liner

---

## 📦 Installation

### ✅ Recommended (One-liner)
> Requires `sudo` and internet access

```bash
bash <(curl -Ls https://raw.githubusercontent.com/hady-khann/SCC/main/install.sh)





## 🐳 Docker Commands (`.dkr-bashrc`)

This module provides convenient shell functions for interacting with Docker and Docker Compose. Once SCC is installed, these commands are auto-sourced into your shell from `/etc/scc/.dkr-bashrc`.

---

### 🔍 Docker Containers

| Command   | Description |
|-----------|-------------|
| `dps`     | Show running containers (`docker ps`) |
| `dpsa`    | Show all containers, including stopped (`docker ps -a`) |
| `dpss`    | Show a simplified, formatted container list |
| `wdps`    | Watch running containers in real-time |
| `wdpss`   | Watch a formatted container list in real-time |

---

### 📊 Docker System Monitoring

| Command       | Description |
|---------------|-------------|
| `dstats`      | Live stats for all containers |
| `dvolumes`    | List Docker volumes |
| `dnetworks`   | List Docker networks |
| `dclean`      | Clean all unused Docker resources (volumes, networks, images, stopped containers) |
| `dimages`     | List all local Docker images |

---

### ⚙️ Docker Compose Shortcuts

| Command       | Description |
|---------------|-------------|
| `dc-build`    | Build the current Docker Compose services |
| `dc-up`       | Start services in detached mode |
| `dc-down`     | Stop and remove services |
| `dc-restart`  | Restart all services |
| `dc-logs`     | Follow logs from services (`-f` for tailing) |
| `dc-ps`       | Show current status of Compose services |

---

### 📁 File Location

These functions are saved in:

```bash
/etc/scc/.dkr-bashrc
