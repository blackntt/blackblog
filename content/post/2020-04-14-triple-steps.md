---
title: Triple steps
author: blackntt
type: post
date: 2020-04-14T09:16:03+00:00
url: /triple-steps/
categories:
  - Algorithms
tags:
  - Algorithm
  - algorithms
  - triple steps

---

## Problem

Với cầu thang n bậc. hỏi có bao nhiêu cách để di chuyển từ chân cầu thang lên đỉnh cầu thang khi mỗi lần sẽ di chuyển 1,2 hoặc bước

## Solution:

Độ phức tạp thời gian: O(n)  
Độ phức tạp không gian: O(n) (có thể giảm xuống O(1) nếu dùng 3 biến để lưu 3 steps gần nhất mà không cần dùng một mảng)

```python
findSteps(n):
   steps=int[n+1]; steps[0]=1; steps[1]=1; steps[2]=2;
   for I from 3 to n do
      steps[I] = steps[I-1]+steps[I-2]+steps[I-3]
return steps[n];
```