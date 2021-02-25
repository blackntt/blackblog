---
title: "Basic Restful Api"
date: 2021-01-21T00:53:36+07:00
tags:
  - Restful
draft: true
---
- Trong Restful sử dụng 4 động từ GET/POST/PUT/DELETE
- Resful là hướng resource nên đường dẫn sẽ viết theo dạng uri. Dạng đường dẫn của các danh từ
- Kết hợp URI và động từ GET/POST/PUT/DELETE để thực hiện truy vấn
- ví dụ:
```
GET /users : lấy danh sách các user
POST /users : thêm một user mới
PUT /users/:id : cập nhập user có :id
DELETE /users/:id : xoá user có :id
```