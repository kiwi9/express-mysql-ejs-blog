## 1目录结构

- config 配置信息
- libs 一些工具库
- models 模型（M）
- public 公共静态文件
- routes 路由（C）
- views 视图（V）
- package.json
- server.js
- .env 环境变量配置文件(不要上传，避免账号泄露)
- blog.sql 数据库

### 说明
需要根据本地环境创建一个.env文件

.env文件包含数据库账号密码私密信息，不要泄露
```
# 格式
HOST=localhost
PORT=3306
USER=root
PASSWORD=123456
DATABASE=blog
```

## 2主要技术栈

- express
- mysql
- ejs

## 3使用 node 包

- express
- body-parser 解析post数据
- multer  文件上传
- cookie-parser cookie
- cookie-session session
- ejs 模板引擎
- consolidate 模板引擎适配
- promise-mysql 异步的mysql，支持async/await
- nodemon 监听文件变化，自动重启服务
- morgan 日志
- http-errors http错误
- mz 包装器，包装node的api，支持promise，如：mz/fs    fs.readFile().then
- dotenv 支持读取环境变量文件.env   process.env.xxx


## 4数据库字典

### users
用户表
```
id  int(8)
username  varchar(32)
password  varchar(32)
is_admin  tinyint(1)
```

### posts
文章表

多对一关系

- 一篇文章只能有一个用户，一个用户可以有多篇文章
- 一篇文章只能有一个分类，一个分类可以有多篇文章

```
id  int(8)
title varchar(100)
content TEXT
summary varchar(255)
publish_time  int
is_publish  tinyint(1)
views int(11)
user_id int(8)
cate_id int(8)
```

### tags
标签表

```
id  int(8)
tagname varchar(50)
```

### posts_tags
文章标签表

多对多关系，用来关联posts和tags

- 一篇文章可以有多个标签，一个标签可以标记多篇文章
```
id int(8)
post_id int(8)
tag_id int(8)
```


### categories
分类表

```
id int(8)
catename  varchar(50)
```

### comments
评论表

多对一关系

一条评论对应一篇文章，一个用户
```
id int(8)
content  varchar(255)
publish_time  int
disabled  tinyint(1)
post_id int(8)
user_id int(8)
```


## 5菜单结构

### admin
- 后台登录
- 管理首页
- 用户管理
- 文章管理
- 分类管理
- 标签管理
- 评论管理

### web
- 首页
- 标签
- 归档
- 关于

## 6路由设置

### admin
- GET /admin  主页
- GET /admin/login  登录
- POST /admin/login  登录
- GET /admin/userManager 用户管理
  - GET /admin/userManager/add  用户添加 
  - POST /admin/userManager/add  用户添加 
  - GET /admin/userManager/edit?id=xx  用户修改
  - POST /admin/userManager/edit?id=xx  用户修改
  - DELETE /admin/userManager/del?id=xx  用户删除
- GET /admin/postManager 文章管理
  - GET /admin/postManager/add  文章添加 
  - POST /admin/postManager/add  文章添加 
  - GET /admin/postManager/edit?id=xx  文章修改
  - POST /admin/postManager/edit?id=xx  文章修改
  - DELETE /admin/postManager/del?id=xx  文章删除
- GET /admin/cateManager 分类管理
  - GET /admin/cateManager/add  分类添加 
  - POST /admin/cateManager/add  分类添加 
  - GET /admin/cateManager/edit?id=xx  分类修改
  - POST /admin/cateManager/edit?id=xx  分类修改
  - DELETE /admin/cateManager/del?id=xx  分类删除
- GET /admin/tagManager 标签管理
  - GET /admin/tagManager/add  标签添加 
  - POST /admin/tagManager/add  标签添加 
  - GET /admin/tagManager/edit?id=xx  标签修改
  - POST /admin/tagManager/edit?id=xx  标签修改
  - DELETE /admin/tagManager/del?id=xx  标签删除
- GET /admin/commentManager 评论管理
  - GET /admin/commentManager/edit?id=xx  评论修改
  - POST /admin/commentManager/edit?id=xx  评论修改
  - DELETE /admin/commentManager/del?id=xx  评论删除

### web
- GET /login  用户登录
- POST /login  用户登录
- GET / 主页
- GET /tags 标签页
- GET /archive 归档
- GET /about 关于
- GET /posts?id=xxx 具体某篇文章



## 7Models

### User
- getAll()
- addUser(user)
- updateUser(id, user)
- delUser(id)

### Post

### Tag

### Category

### Comment