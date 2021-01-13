---
title: Genomic Range Query
author: blackntt
type: post
date: 2020-08-20T07:35:39+00:00
url: /genomic-range-query/
categories:
  - Algorithms

---
Đây là bài toán được sử dụng rèn luyện cho coding interview trên codility.

## Problem

Bài này có nội dung như sau:

Một chuỗi gen được biểu diễn một chuỗi S tập của 4 kí tự A, C, G, T. Mỗi kí tự này sẽ tương ứng với một hệ số lần lượt là 1,2,3,4. Một bộ truy vấn thông tin trên chuỗi gen được cho sẽ được thực hiện với mục đích là tìm hệ số thấp nhất trong đoạn được truy vấn. Ví dụ cho chuỗi ACCAG, nếu truy vấn trong đoạn [2,3] thì hệ số là 1 vì C là 2, A là 1 nên chọn 1.

Tập các cả các đoạn truy vẫn sẽ chứa trong tập P và Q, P[i] là biên trái của đoạn cần truy vấn, Q[i] là biên phải của đoạn truy vấn. Chương trình cần trả về một tập số nguyên R với số nguyên ở vị trí i là hệ số thấp nhất của đoạn [P[i], Q[i]].

Yêu cầu: viết một chương trình hiệu quả để tìm kết quả các câu truy vấn.

## Solution
```
  * Độ phức tạp thời gian: O(N+M)
  * Độ phức tạp không gian: O(N+M)
  * N: là độ dài của S
  * M: là độ dài của P
```

```python
query(S,P,Q):
  results[P.length]
  counts[S.length][4]
  for i from 0 to S.length - 1
    for j from 0 to 3
      counts[i][j] = 0
    if S[i] == 'A'
      counts[i][0] = 1
    if S[i] == 'C'
      counts[i][1] = 1
    if S[i] == 'G'
      counts[i][2] = 1
    if S[i] == 'T'
      counts[i][3] = 1
  for i from 1 to S.length - 1
    for j from 0 to 3
      S[i][j] += S[i][j-1]
  for i from 0 to P.length - 1
    minIndex = P[i]-1
    if minIndex >= 0 
      for j from 0 to 3
        temp = counts[P[i][j] - counts[minIndex][j]
        if temp > 0
          results[i] = j+1
          break;
    else
       for j from 0 to 3
        temp = counts[P[i][j]
         if temp > 0
           results[i] = j+1
           break;
   return results
```