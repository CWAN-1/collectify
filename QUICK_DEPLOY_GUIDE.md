# 🚀 Collectify - 快速部署到 Vercel 并生成 APK

## 完整步骤（5分钟搞定！）

---

## 📋 第一部分：推送到 GitHub

### 步骤 1：创建 GitHub 仓库

1. 访问 https://github.com/new
2. 仓库名称：`collectify`（或您喜欢的名字）
3. 选择 **Public** 或 **Private**
4. **不要**勾选 "Initialize this repository with a README"
5. 点击 "Create repository"

### 步骤 2：关联并推送代码

在项目根目录运行以下命令（替换为您的 GitHub 用户名）：

```bash
git remote add origin https://github.com/YOUR_USERNAME/collectify.git
git branch -M main
git push -u origin main
```

**注意**：将 `YOUR_USERNAME` 替换为您的 GitHub 用户名！

---

## 🚀 第二部分：部署到 Vercel

### 步骤 1：访问 Vercel

1. 打开 https://vercel.com
2. 点击 "Sign Up" 或 "Log In"
3. 使用 **GitHub 账号**登录（推荐）

### 步骤 2：导入项目

1. 登录后，点击 "New Project"
2. 在 "Import Git Repository" 部分找到您的 `collectify` 仓库
3. 点击 "Import" 按钮

### 步骤 3：配置并部署

1. **Project Name**：保持默认或修改为您喜欢的名字
2. **Framework Preset**：应该自动检测为 "Next.js"
3. **Root Directory**：保持为 `./`
4. **Build and Output Settings**：保持默认
5. **Environment Variables**：暂时不需要设置（可以后续添加）

点击 **"Deploy"** 按钮！

### 步骤 4：等待部署完成

- 部署通常需要 1-2 分钟
- 您会看到实时的构建日志
- 完成后会显示 "Congratulations!" 页面

---

## 📱 第三部分：生成 Android APK

### 步骤 1：获取 Vercel 部署 URL

部署成功后，您会得到一个类似这样的 URL：
`https://collectify-xxx.vercel.app`

**复制这个 URL！**

### 步骤 2：使用 PWA Builder

1. 访问 https://www.pwabuilder.com
2. 在输入框中粘贴您的 Vercel URL
3. 点击 **"Start"** 按钮

### 步骤 3：分析和评分

- PWA Builder 会分析您的应用
- 您会看到一个评分（不用担心，即使不是满分也可以打包）
- 点击右上角的 **"Package for stores"**

### 步骤 4：选择 Android 平台

1. 在 "Packages" 页面，找到 **"Android"** 卡片
2. 点击 **"Generate Package"** 或 **"Download"**
3. 等待几秒钟，APK 文件会自动下载

### 步骤 5：测试 APK

1. 将下载的 APK 文件传输到 Android 设备
2. 在 Android 设备上：
   - 打开 "设置" → "安全"
   - 启用 "未知来源" 或 "安装未知应用"
3. 点击 APK 文件进行安装
4. 打开应用测试！

---

## ✅ 完成！

您现在拥有：
- ✅ 一个在线运行的 Collectify 应用
- ✅ 一个可以安装到 Android 设备的 APK 文件

---

## 💡 小贴士

### 每次 Push 代码自动部署

Vercel 会自动监听您的 GitHub 仓库，每次 push 代码都会自动重新部署！

### 自定义域名

在 Vercel 项目设置中，您可以添加自定义域名（如 collectify.com）。

### 环境变量

如果需要添加环境变量（如 API keys），在 Vercel 项目设置的 "Environment Variables" 部分添加。

### 更多平台

PWA Builder 还支持：
- iOS（需要 Apple Developer 账号）
- Windows
- Microsoft Store
- Google Play Store

---

## 🆘 遇到问题？

### Git Push 失败？
- 检查 GitHub 用户名是否正确
- 确认您有仓库的写入权限
- 尝试使用 SSH 而不是 HTTPS

### Vercel 部署失败？
- 检查构建日志中的错误信息
- 确保所有依赖都在 package.json 中
- 确认 Next.js 配置正确

### PWA Builder 报错？
- 确保您的 Vercel URL 是 HTTPS（Vercel 自动提供）
- 检查 manifest.json 是否正确（我们已经配置好了）
- 尝试刷新页面重新分析

---

**祝您使用愉快！🎉**
