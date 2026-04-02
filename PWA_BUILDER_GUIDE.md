# Collectify - Android APK 生成指南

使用 PWA Builder 为 Collectify 生成测试用的 Android APK 包。

## 前置条件

1. 项目已配置 PWA 支持（已完成）
2. 应用需要部署到 HTTPS 环境
3. 访问 https://www.pwabuilder.com

## 步骤 1：构建 Next.js 应用

首先构建并部署应用到 HTTPS 环境：

```bash
npm run build
npm start
```

或部署到 Vercel、Netlify 等支持 HTTPS 的平台。

## 步骤 2：准备图标

确保在 public/ 目录下有以下图标文件：

- icon-192x192.png
- icon-512x512.png
- icon-1024x1024.png（用于 PWA Builder）

可以使用项目现有的图标进行转换。

## 步骤 3：使用 PWA Builder

### 方法 A：使用在线 PWA Builder（推荐）

1. 访问 https://www.pwabuilder.com
2. 在输入框中输入您的应用 HTTPS URL（例如：https://your-app.vercel.app）
3. 点击 "Start" 按钮
4. PWA Builder 会分析您的 PWA 并生成报告
5. 点击 "Package for stores"
6. 选择 "Android" 平台
7. 点击 "Generate Package"
8. 下载生成的 APK 文件

### 方法 B：使用 PWA Builder CLI

1. 安装 PWA Builder CLI：

```bash
npm install -g @pwabuilder/cli
```

2. 打包应用：

```bash
pwabuilder package --url https://your-app-url.com --platform android
```

## 步骤 4：安装和测试 APK

1. 将生成的 APK 文件传输到 Android 设备
2. 在设备上启用 "未知来源" 应用安装
3. 点击 APK 文件进行安装
4. 测试应用功能

## 注意事项

1. **HTTPS 要求**：PWA 必须在 HTTPS 环境下运行才能正常工作
2. **图标尺寸**：确保有正确尺寸的图标，特别是 512x512 和 192x192
3. **测试环境**：APK 是测试版本，不应用于生产环境
4. **性能**：首次加载可能需要较长时间，后续会使用缓存

## 本地测试（使用 ngrok）

如果没有 HTTPS 环境，可以使用 ngrok：

```bash
npm install -g ngrok
ngrok http 3000
```

然后使用 ngrok 提供的 HTTPS URL 访问 PWA Builder。

## 替代方案：使用 Capacitor

如果需要更好的原生体验，可以使用 Capacitor：

1. 安装 Capacitor：

```bash
npm install @capacitor/core @capacitor/cli @capacitor/android
npx cap init
npx cap add android
```

2. 构建并同步：

```bash
npm run build
npx cap sync
```

3. 在 Android Studio 中打开项目并构建 APK

---

**提示**：对于快速测试，建议使用 PWA Builder 在线工具，它是最简单快速的方法。
