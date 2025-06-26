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
