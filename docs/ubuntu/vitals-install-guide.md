# Ubuntu 顶栏系统监控安装指南：Vitals

本文介绍如何在 Ubuntu 的 GNOME 桌面环境中安装 **Vitals** 扩展，让 CPU、RAM、温度、网络速度等系统信息实时显示在顶部状态栏中。

---

## 1. Vitals 是什么

**Vitals** 是一个 GNOME Shell 扩展，可以直接在 Ubuntu 顶部状态栏中显示系统资源使用情况，例如：

- CPU 使用率
- 内存（RAM）使用量
- CPU / GPU 温度
- 网络上传 / 下载速度
- 磁盘使用情况
- 风扇转速
- 系统负载
- 电池状态（笔记本）

安装完成后，顶部状态栏可以显示类似：

```text
CPU 12%   RAM 6.3G/32G   47°C   ↓ 2.1 MB/s   ↑ 320 KB/s
```

---

## 2. 确认当前桌面环境

Vitals 主要用于 **GNOME Desktop**。

可以运行：

```bash
echo $XDG_CURRENT_DESKTOP
```

如果输出中包含：

```text
GNOME
```

或者：

```text
ubuntu:GNOME
```

通常就可以使用 Vitals。

---

## 3. 更新软件源

首先打开终端：

```bash
Ctrl + Alt + T
```

然后更新 Ubuntu 软件源：

```bash
sudo apt update
```

---

## 4. 安装 GNOME Extension Manager

推荐通过 **Extension Manager** 来安装和管理 GNOME 扩展。

运行：

```bash
sudo apt install gnome-shell-extension-manager
```

安装完成后，可以直接从应用程序菜单搜索：

```text
Extension Manager
```

也可以在终端运行：

```bash
extension-manager
```

---

## 5. 安装 Vitals

打开 **Extension Manager** 后：

1. 点击顶部的 **Browse**
2. 在搜索框中输入：

```text
Vitals
```

3. 找到 **Vitals**
4. 点击 **Install**
5. 确认安装

安装完成后，Vitals 通常会自动启用。

---

## 6. 检查 Vitals 是否已经启用

在 Extension Manager 中进入：

```text
Installed
```

找到：

```text
Vitals
```

确认右侧开关处于开启状态。

如果没有开启，手动打开即可。

---

## 7. 配置 Vitals

点击 Vitals 旁边的设置按钮，可以选择显示哪些系统信息。

建议开启以下项目：

- CPU Usage
- Memory Usage
- Temperature
- Network Download
- Network Upload

如果电脑有独立显卡，也可以查看是否支持 GPU 相关信息。

为了避免顶部状态栏过于拥挤，可以只显示最重要的信息，例如：

```text
CPU 18%   RAM 7.2G   52°C
```

---

## 8. 推荐配置

如果主要用于开发、深度学习、ROS、CARLA 或其他计算任务，可以考虑显示：

```text
CPU Usage
RAM Usage
CPU Temperature
Network Download
Network Upload
System Load
```

如果机器支持 GPU 监控，也可以增加 GPU 相关项目。

---

## 9. 安装温度传感器工具

如果 Vitals 无法读取 CPU 温度，可以安装：

```bash
sudo apt install lm-sensors
```

然后运行：

```bash
sudo sensors-detect
```

通常一路按：

```text
Enter
```

接受默认选项即可。

检测完成后，可以使用：

```bash
sensors
```

查看温度，例如：

```text
Package id 0:  +48.0°C
Core 0:        +45.0°C
Core 1:        +46.0°C
```

如果 `sensors` 可以正常读取温度，Vitals 一般也可以读取。

---

## 10. 查看已经安装的 GNOME 扩展

可以运行：

```bash
gnome-extensions list
```

查看当前系统安装的 GNOME 扩展。

如果想只查找 Vitals：

```bash
gnome-extensions list | grep -i vitals
```

---

## 11. 如果安装后顶部没有出现 Vitals

### 方法 1：关闭再重新开启

打开：

```bash
extension-manager
```

进入：

```text
Installed
```

将 Vitals 关闭，然后重新打开。

---

### 方法 2：注销并重新登录

有些 GNOME Shell 扩展安装后需要重新加载桌面环境。

可以：

```text
Log Out
```

然后重新登录 Ubuntu。

---

### 方法 3：重启电脑

如果扩展仍然没有显示：

```bash
sudo reboot
```

---

## 12. 卸载 Vitals

如果之后不想使用 Vitals，可以：

1. 打开 Extension Manager
2. 进入 **Installed**
3. 找到 **Vitals**
4. 点击删除 / 卸载

Extension Manager 本身也可以卸载：

```bash
sudo apt remove gnome-shell-extension-manager
```

如果还想清理不再需要的依赖：

```bash
sudo apt autoremove
```

---

## 13. 常用系统监控工具

除了 Vitals，还可以安装以下工具。

### htop

```bash
sudo apt install htop
```

运行：

```bash
htop
```

适合在终端中查看 CPU、RAM 和进程。

---

### btop

```bash
sudo apt install btop
```

运行：

```bash
btop
```

相比 htop，界面更加现代，能够显示：

- CPU
- RAM
- Swap
- Disk
- Network
- Processes

---

### sensors

查看 CPU 和主板温度：

```bash
sensors
```

---

## 14. 推荐组合

对于 Ubuntu 开发工作站，推荐使用：

```text
Vitals
  ↓
顶部状态栏实时查看 CPU / RAM / 温度 / 网络

btop
  ↓
需要详细分析系统资源时使用

nvidia-smi
  ↓
如果使用 NVIDIA GPU，查看 GPU / 显存 / 温度
```

NVIDIA GPU 用户可以运行：

```bash
nvidia-smi
```

实时刷新：

```bash
watch -n 1 nvidia-smi
```

---

## 15. 最简安装流程

如果只需要快速安装，可以直接执行：

```bash
sudo apt update
sudo apt install gnome-shell-extension-manager
```

然后启动：

```bash
extension-manager
```

进入：

```text
Browse
```

搜索：

```text
Vitals
```

点击：

```text
Install
```

最后在：

```text
Installed → Vitals
```

中打开并配置需要显示的 CPU、RAM、温度和网络信息。

---

## 完成

安装完成后，Ubuntu 顶部状态栏即可实时显示系统资源使用情况。

推荐显示：

```text
CPU | RAM | Temperature | Network
```

这样在运行编译、训练模型、ROS、CARLA 或其他高负载任务时，可以很方便地观察系统状态。
