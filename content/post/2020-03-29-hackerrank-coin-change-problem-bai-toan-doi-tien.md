---
title: '[HackerRank] Coin change problem – bài toán đổi tiền'
author: blackntt
type: post
date: 2020-03-29T13:34:01+00:00
url: /hackerrank-coin-change-problem-bai-toan-doi-tien/
categories:
  - Algorithms
tags:
  - c++
  - dynamic programming
  - HackerRank

---
# Problem

Cho số tiền cần đổi là N, và tập các loại tiền có số lượng tờ không giới hạn C = {c1, c2,&#8230;,cm}.  
Cho biết số cách đổi số tiền N bằng các tờ tiền có mệnh giá nằm trong C.

# Solution

Khi đổi tiền N ta sẽ có các tình huống:  
&#8211; Số tiền N là 0, số cách đổi chắc chắn là 1.  
&#8211; Số tiền N < 0, không thể thực hiện quy đổi, không tồn tại cách đổi nào.  
&#8211; Số tiền N > 0, số cách đổi sẽ bằng tổng số cách đổi tiền có chứa ít nhất một tờ có mệnh giá m (m là mệnh giá lớn nhất có thể tham gia quy đổi hiện tại) và số cách đổi tiền không chứa bất kì tờ nào có mệnh giá m:  
+ số cách đổi = D(N-m,m,C) + D(N,m-1,C)