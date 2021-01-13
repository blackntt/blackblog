---
title: Observer Pattern
author: blackntt
type: post
date: 2018-08-14T16:52:06+00:00
url: /observer-pattern/
categories:
  - Design Pattern
tags:
  - Design Pattern
  - Java
  - Observer Pattern

---
  * Được sử dụng phổ biến, ví dụ nó được sử dụng để xây dựng nên các kiểu xử lý liên quan đến event listener trong các ngôn ngữ lập trình như java (các listener trong Java), C# (Event trong C#),..
  * Mô tả:  mẫu thiết kế này được sử dụng khi ta mong muốn các objects (Observer) luôn biết được sự thay đổi của đối tượng quan tâm subject. Subject sẽ lưu trữ danh sách các observer và thông báo sự thay đổi trạng thái đến observer đã đăng kí.
  * Sơ đồ cài đặt minh họa:
  *<img class="aligncenter" src="http://blacklogs.net/wp-content/uploads/2018/08/913.png" />