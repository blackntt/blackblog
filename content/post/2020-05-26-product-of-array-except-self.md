---
title: Product of Array Except Self
author: blackntt
type: post
date: 2020-05-26T13:02:02+00:00
url: /product-of-array-except-self/
categories:
  - Algorithms
tags:
  - Algorithm
  - algorithms
  - leetcode

---
### Problem:

Cho một mảng số nguyên gồm N phần tử. Yêu cầu tính toán và xuất ra một mảng có N phần tử biết rằng mỗi phần tử thứ i của mảng đầu ra là tích của các phần tử trong mảng đầu vào trừ phần tử thứ i ở mảng đầu vào.

Ví dụ: [1,2,3,4] &#8211;> [28,12,8.6]

### Solution:

Hướng dẫn chi tiết:

  * Độ phức tạp thời gian: O(n)
  * Độ phức tạp không gian: O(n)

```c++
leftProd[n]
rightProd[n]
Prod[n]

For i: 0 -> n-1
	If I == 0
		leftProd[i]=1
	Else
		leftProd[i]= leftProd[i-1]*arr[i-1]
For i: n-1 -> 0
	If I == n-1
		rightProd[i]=1
	Else
		rightProd[i]=rightPro[i+1]*arr[i+1]
    Prod[i] = leftProd[i]*rightProd[i]
```