# General Questions

## Questions

### 1 如何确认自己电脑上面安装的是docker io还是docker-ce？以及docker compose版本是多少？

要确认在 Linux 系统上安装的是 `docker.io` 还是 `docker-ce` 以及检查 Docker Compose 的版本，你可以使用以下几个命令：

**确认 Docker 版本**

1. **检查 Docker 版本**：
   
   ```bash
   docker --version
   ```
   这个命令将显示 Docker 的版本信息，通常会在版本描述中指出是 Docker CE 还是其他版本。
   
2. **检查安装的包**：
   - 如果你使用的是 Debian 或 Ubuntu 系统，可以用以下命令检查是否安装了 `docker.io` 或 `docker-ce`：
     ```bash
     dpkg -l | grep -E 'docker.io|docker-ce'
     ```
   - 这个命令会列出所有安装的包，其中包括 `docker.io` 或 `docker-ce`。

**确认 Docker Compose 版本**

- **检查 Docker Compose 版本**：
  ```bash
  docker-compose --version
  ```
  这个命令会输出已安装的 Docker Compose 的版本信息。

这些命令提供了足够的信息来识别你的系统中安装的 Docker 和 Docker Compose 的具体版本和类型。通过这样的检查，你可以确认自己的配置是否符合预期，以及是否需要更新或调整。

### 2 docker io 和 docker-ce 的区别

这两种 Docker 安装方法在 Linux 系统上有不同的作用和目的。以下是它们各自的特点和差异：

**第一种方法：安装 Docker 社区版 (Docker CE)**

这种方法是从 Docker 的官方仓库直接安装 Docker 社区版 (Docker CE)。步骤比较详细，包括了设置 Docker 官方 GPG 密钥和仓库，以确保下载的软件包是安全和未被篡改的。详细步骤如下：

1. **更新系统包列表**：使用 `sudo apt-get update` 来更新本地的包列表，确保安装最新版本的软件。
2. **安装 HTTPS 支持**：通过 `sudo apt-get install ca-certificates curl` 安装支持 HTTPS 的必需包，确保能安全访问 Docker 仓库。
3. **配置密钥存储**：创建 `/etc/apt/keyrings` 目录，并下载 Docker 的 GPG 公钥到这个目录，设置适当的权限，以验证后续下载的软件包。
4. **添加 Docker 仓库**：向系统的 APT 源列表中添加 Docker 的官方仓库。这样做可以从 Docker 的官方源安装到 Docker 最新版本。
5. **安装 Docker**：最后安装 `docker-ce` (Docker 社区版), `docker-ce-cli` (Docker 命令行工具), `containerd.io` (容器运行时), `docker-buildx-plugin` (构建x插件), 和 `docker-compose-plugin` (Docker Compose 插件)。

这种安装方法适用于需要最新版本 Docker，或者希望通过 Docker 官方渠道获得支持和更新的用户。

**第二种方法：使用 Ubuntu 默认软件库安装**

这种方法通过 Ubuntu 的默认软件库安装 `docker.io`，这是 Ubuntu 官方软件库中的 Docker 包。这个包可能不是最新版本，但是由 Ubuntu 维护，通常与系统兼容性更好。

1. **一键更新并安装**：使用 `sudo apt -y update && sudo apt -y install docker.io nvidia-container-toolkit` 更新系统包并安装 Docker 以及 Nvidia 容器工具包，后者允许 Docker 利用 Nvidia GPU。
2. **重载和重启 Docker 服务**：安装完成后，使用 `systemctl daemon-reload` 重载系统守护进程，然后重启 Docker 服务以应用新的配置。

这种方法的优点是快速简便，特别是对于不需要最新 Docker 版本的用户，或者那些更倾向于使用由他们的 Linux 发行版直接支持的软件包。

**总结**

- **第一种方法** 提供了最新的 Docker 版本，更多的配置选项和插件支持，适合需要最新特性或官方支持的场景。
- **第二种方法** 更为简单快捷，适合对 Docker 版本要求不高，或者优先考虑系统稳定性和兼容性的用户。

根据你的具体需求和使用场景选择合适的安装方法。如果需要最新功能和更好的可定制性，建议使用第一种方法。如果优先考虑简便性和维护性，第二种方法会更合适。

### 3 如果我想要在安装docker.io 后 再继续安装 docker-ce 也可以吗？

将 `docker.io`（Ubuntu 软件库中的 Docker 包）和 `docker-ce`（Docker 社区版，从 Docker 的官方仓库安装）同时安装在同一台机器上通常是不推荐的，也可能导致冲突。这两个包可能会尝试使用相同的系统资源，如端口、配置文件和其他依赖，这可能导致不稳定或配置上的错误。

如果你已经安装了 `docker.io` 并且想要切换到 `docker-ce`（官方版本），推荐的步骤是先卸载 `docker.io`，然后安装 `docker-ce`。这样可以确保系统的整洁和软件的正常运行。以下是相关步骤：

**卸载 `docker.io`**

1. 停止所有正在运行的 Docker 容器。
2. 卸载 `docker.io` 和相关的依赖包：
   ```bash
   sudo apt-get remove --auto-remove docker.io
   ```
3. 清理系统，确保没有残留的配置文件影响新的安装：
   ```bash
   sudo apt-get purge --auto-remove docker.io
   ```

**安装 `docker-ce`**

接下来，按照前面描述的步骤安装 `docker-ce` 和相关组件：

1. 添加 Docker 官方 GPG 密钥和仓库。
2. 使用以下命令安装 Docker 社区版和其他工具：
   ```bash
   sudo apt-get update
   sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
   ```

**验证安装**

安装完成后，你可以运行以下命令来验证 Docker 是否安装成功并且可以正常工作：
```bash
docker --version
docker-compose --version
```

这些命令将显示安装的 Docker 和 Docker Compose 的版本，确认你正在运行最新的社区版。

## 4 launch docker and stop docker

```
# start docker
sudo systemctl start docker
# stop docker
sudo systemctl stop docker
# run docker container 
docker run [options] <image>
# check running container
docker ps
```

