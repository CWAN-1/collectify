# 安装 ngrok 指南

## 方法一：使用 Homebrew（macOS 推荐）

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install ngrok
```

## 方法二：手动下载安装（最简单）

1. 访问 https://ngrok.com/download
2. 下载适用于您系统的版本（macOS Darwin ARM64）
3. 解压下载的文件
4. 将 `ngrok` 可执行文件移动到 `/usr/local/bin`：

```bash
sudo mv ~/Downloads/ngrok /usr/local/bin/
```

5. 验证安装：

```bash
ngrok version
```

## 方法三：使用 npm（如果可以）

```bash
npm install -g ngrok
```

## 验证安装

运行以下命令检查 ngrok 是否安装成功：

```bash
ngrok version
```

如果看到版本号，说明安装成功！

## 配置 ngrok（可选但推荐）

1. 注册 ngrok 账号：https://ngrok.com/signup
2. 获取您的 auth token
3. 运行：

```bash
ngrok config add-authtoken YOUR_AUTH_TOKEN
```

## 快速测试

安装完成后，测试 ngrok：

```bash
ngrok http 80
```

按 `Ctrl+C` 停止。
