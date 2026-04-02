# 快速部署到 Vercel（无需 ngrok）

这是最简单的方法，无需配置 ngrok！

## 方法一：使用 Vercel Dashboard（最简单）

1. **Push 代码到 GitHub**
   - 创建一个 GitHub 仓库
   - 将代码推送到仓库

2. **访问 Vercel**
   - 打开 https://vercel.com
   - 使用 GitHub 账号登录

3. **导入项目**
   - 点击 "New Project"
   - 选择您的 GitHub 仓库
   - 点击 "Import"

4. **部署**
   - 保持默认设置
   - 点击 "Deploy"
   - 等待 1-2 分钟

5. **完成！**
   - 您会得到一个类似 `https://collectify-xxx.vercel.app` 的 HTTPS URL
   - 使用这个 URL 去 PWA Builder 打包 APK

---

## 方法二：使用 Vercel CLI

### 1. 安装 Vercel CLI

```bash
npm install -g vercel
```

### 2. 登录并部署

```bash
# 登录
vercel login

# 部署（在项目根目录运行）
vercel
```

### 3. 按照提示操作

- 选择 "Set up and deploy"
- 选择您的账号
- 保持默认设置
- 等待部署完成

### 4. 获取部署 URL

部署完成后，您会得到一个 HTTPS URL，例如：
`https://collectify-xxx.vercel.app`

---

## 使用 PWA Builder 生成 APK

1. 复制您的 Vercel HTTPS URL
2. 访问 https://www.pwabuilder.com
3. 粘贴 URL，点击 "Start"
4. 点击 "Package for stores"
5. 选择 "Android"
6. 下载 APK 文件

---

## 为什么选择 Vercel？

✅ **完全免费**
✅ **自动 HTTPS**
✅ **全球 CDN 加速**
✅ **自动部署（Push 代码自动更新）**
✅ **无需配置 ngrok**
✅ **生产级别的托管**
