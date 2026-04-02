# ngrok 本地测试脚本使用说明

## ⚠️ 重要：先安装 ngrok

由于网络问题，自动安装可能会失败。请先手动安装 ngrok：

### 快速安装步骤：

1. **下载 ngrok**：访问 https://ngrok.com/download
2. **选择 macOS Darwin ARM64** 版本下载
3. **解压并安装**：

```bash
# 假设下载到 Downloads 目录
sudo mv ~/Downloads/ngrok /usr/local/bin/

# 验证安装
ngrok version
```

**详细安装指南请查看：** [INSTALL_NGROK.md](./INSTALL_NGROK.md)

---

## 快速开始

### 安装 ngrok 后，使用以下命令启动：

### 方式一：使用 npm 命令（推荐）

```bash
# 启动完整版本（带日志和自动 URL 检测）
npm run ngrok

# 启动简化版本
npm run ngrok:simple
```

### 方式二：直接运行脚本

```bash
# 完整版本
./scripts/start-ngrok.sh

# 简化版本
./scripts/start-ngrok-simple.sh
```

## 前置条件

### 1. 安装 ngrok（必须）

✅ **推荐方式：手动下载安装**（最可靠）

访问 https://ngrok.com/download 下载适合您系统的版本，然后：

```bash
# macOS
sudo mv ~/Downloads/ngrok /usr/local/bin/

# 验证
ngrok version
```

**详细指南请查看：** [INSTALL_NGROK.md](./INSTALL_NGROK.md)

### 2. 认证 ngrok（可选，但推荐）

注册 ngrok 账号获取 auth token：https://ngrok.com/signup

```bash
ngrok config add-authtoken YOUR_AUTH_TOKEN
```

## 脚本说明

### start-ngrok.sh（完整版本）

功能：
- ✅ 自动检测并安装 ngrok
- ✅ 自动获取并显示 HTTPS URL
- ✅ 显示 ngrok 仪表板链接
- ✅ 日志记录到 `logs/` 目录
- ✅ 优雅的清理机制

输出：
```
✅ Public URL (use this for PWA Builder):
   https://abc123.ngrok.io

✅ Local URL:
   http://localhost:3000

✅ ngrok Dashboard:
   http://localhost:4040
```

### start-ngrok-simple.sh（简化版本）

功能：
- ✅ 轻量级，启动更快
- ✅ 简洁的输出
- ✅ 适合快速测试

## 使用 PWA Builder 生成 APK

1. 运行 `npm run ngrok` 启动服务
2. 复制显示的 HTTPS URL（例如：https://abc123.ngrok.io）
3. 访问 https://www.pwabuilder.com
4. 粘贴 URL，点击 Start
5. 点击 "Package for stores" → 选择 "Android"
6. 下载 APK 文件

## 访问地址

启动后可以访问：

- **本地开发**：http://localhost:3000
- **公网访问**：https://xxx.ngrok.io（脚本会显示）
- **ngrok 仪表板**：http://localhost:4040

## 停止服务

在终端中按 `Ctrl+C` 即可停止所有服务。

## 故障排除

### ngrok URL 没有自动显示

访问 http://localhost:4040 查看 ngrok 仪表板获取 URL。

### 端口被占用

修改脚本中的端口号，或停止占用端口的进程。

### 权限问题

如果遇到权限错误，重新设置执行权限：
```bash
chmod +x scripts/*.sh
```
