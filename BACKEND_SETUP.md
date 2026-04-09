# Collectify 后端搭建指南

## 🚀 快速开始

### 1. 安装依赖

```bash
npm install
```

### 2. 设置数据库

**选项 A：使用 Supabase（推荐，免费）**

1. 访问 https://supabase.com
2. 创建新项目
3. 获取数据库连接字符串（Settings → Database → Connection String）
4. 创建 `.env.local` 文件：

```env
DATABASE_URL="postgresql://user:password@host:5432/postgres?schema=public"
NEXTAUTH_URL="http://localhost:3000"
NEXTAUTH_SECRET="your-secret-key-here-change-in-production"
MIDTRANS_SERVER_KEY="SB-Mid-server-..."
MIDTRANS_CLIENT_KEY="SB-Mid-client-..."
MIDTRANS_IS_PRODUCTION=false
NEXT_PUBLIC_APP_URL="http://localhost:3000"
```

**选项 B：本地 PostgreSQL**

```bash
# 使用 Docker
docker run -d -p 5432:5432 -e POSTGRES_PASSWORD=password -e POSTGRES_DB=collectify postgres:15
```

### 3. 初始化数据库

```bash
# 生成 Prisma Client
npx prisma generate

# 运行迁移
npx prisma db push

# （可选）打开 Prisma Studio 查看数据
npx prisma studio
```

### 4. 启动开发服务器

```bash
npm run dev
```

---

## 📡 API 端点文档

### 认证

#### POST `/api/auth/register`
注册新用户

**请求体：**
```json
{
  "email": "user@example.com",
  "username": "johndoe",
  "password": "password123",
  "name": "John Doe"
}
```

#### POST `/api/auth/login`
用户登录

**请求体：**
```json
{
  "email": "user@example.com",
  "password": "password123"
}
```

### 商品

#### GET `/api/listings`
获取商品列表

**查询参数：**
- `category`（可选）：分类筛选
- `search`（可选）：搜索关键词
- `page`（可选）：页码，默认 1
- `limit`（可选）：每页数量，默认 20

#### GET `/api/listings/[id]`
获取单个商品详情

---

## 🗄️ 数据库结构

### User（用户）
- `id`: 用户ID
- `email`: 邮箱（唯一）
- `username`: 用户名（唯一）
- `name`: 姓名
- `avatar`: 头像
- `password`: 加密密码
- `phone`: 电话
- `address`: 地址
- `verified`: 是否已验证
- `role`: 角色（USER/ADMIN）

### Listing（商品）
- `id`: 商品ID
- `title`: 标题
- `description`: 描述
- `price`: 价格
- `category`: 分类
- `condition`: 状态
- `images`: 图片数组
- `isActive`: 是否上架
- `isAuction`: 是否拍卖
- `auctionEnd`: 拍卖结束时间
- `sellerId`: 卖家ID

### Order（订单）
- `id`: 订单ID
- `status`: 订单状态
- `totalAmount`: 总金额
- `listingId`: 商品ID
- `buyerId`: 买家ID
- `sellerId`: 卖家ID
- `paymentId`: 支付ID
- `paymentStatus`: 支付状态
- `shippingAddress`: 收货地址
- `trackingNumber`: 物流单号

### Message（消息）
- `id`: 消息ID
- `content`: 内容
- `read`: 是否已读
- `senderId`: 发送者ID
- `receiverId`: 接收者ID
- `listingId`: 关联商品ID

---

## 💰 Midtrans 支付集成（印尼）

### 1. 获取 Midtrans 密钥

1. 访问 https://midtrans.com
2. 注册商家账户
3. 获取 Sandbox 密钥（测试用）
4. 获取 Production 密钥（上线用）

### 2. 配置环境变量

```env
MIDTRANS_SERVER_KEY="SB-Mid-server-..."
MIDTRANS_CLIENT_KEY="SB-Mid-client-..."
MIDTRANS_IS_PRODUCTION=false
```

### 3. 支持的支付方式

- 银行转账（BCA、BNI、BRI、Mandiri）
- e-Wallet（GoPay、OVO、DANA、ShopeePay）
- 信用卡
- 便利店（Indomaret、Alfamart）

---

## 🔐 安全建议

1. **永远不要**将 `.env.local` 提交到 Git
2. 在生产环境使用强密码
3. 启用 HTTPS
4. 定期轮换密钥
5. 设置 CORS 限制

---

## 📚 下一步

1. ✅ 完成数据库设置
2. ✅ 创建测试用户
3. ✅ 测试 API 端点
4. ✅ 集成前端与后端
5. ✅ 添加更多 API 端点（创建商品、出价、下单等）
6. ✅ 配置 Midtrans 支付
7. ✅ 部署到生产环境

---

## 🆘 常见问题

**Q: Prisma 迁移失败？**
A: 检查数据库连接字符串是否正确，确保数据库服务正在运行。

**Q: 如何重置数据库？**
A: `npx prisma migrate reset`（注意：这会删除所有数据！）

**Q: 如何查看数据库数据？**
A: 运行 `npx prisma studio` 打开图形界面。
