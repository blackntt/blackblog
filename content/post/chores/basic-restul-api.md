---
title: "Đặt tên các Restful API"
date: 2021-01-21T00:53:36+07:00
tags:
  - Restful
---
- Trong Restful sử dụng 4 động từ GET/POST/PUT/DELETE
- Resful là hướng resource nên đường dẫn sẽ viết theo dạng URI. Dạng đường dẫn của các danh từ
- Kết hợp URI và động từ GET/POST/PUT/DELETE để thực hiện truy vấn. Trong đó, chúng được sử dụng với ý nghĩa như sau:
```
GET cho lấy thông tin
POST cho thao tác thêm
PUT cho thao tác sửa
DELETE cho thao tác xoá
```
- ví dụ:
```
GET /users : lấy danh sách các user
POST /users : thêm một user mới
PUT /users/:id : cập nhập user có :id
DELETE /users/:id : xoá user có :id
GET /users/:id/email: lấy email của user có {id}
```