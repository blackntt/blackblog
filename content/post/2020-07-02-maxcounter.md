---
title: MaxCounter
author: blackntt
type: post
date: 2020-07-02T15:16:32+00:00
url: /maxcounter/
categories:
  - Algorithms
tags:
  - Algorithm
  - cấu trúc dữ liệu
  - data structure
  - giải thuật
  - max counter

---
 

Đây là một bài toán mọi người có thể gọi ở một số trang về thuật toán chuẩn bị cho vòng coding interview ở các công ty công nghệ.

## Problem

Cho 1 mảng A gồm M phần tử và 1 mảng counters có N phần tử. Yêu cầu, xuất ra mảng counters sau khi duyệt hết toàn bộ phần tử trong mảng A với quy tắc như sau:

  * Nếu phần tử i trong A có giá trị A[i] < N thì tăng giá trị ở counter[A[i]-1] lên 1 đơn vị
  * Nếu phần tử i trong A có giá trị A[i] == N thì tất cả các phần tử trong counters sẽ có giá trị là phần tử lớn nhất trong counters

Ví dụ: A[3 , 4 , 4, 6,1 , 4,4]. kết quả counters = [3, 2, 2, 4, 2]

## Solution:

Độ phức tạp thời gian: 0(N+M) với N là số lượng counter, M là số lượng phần tử trong mảng A  
Độ phức tạp không gian: O(N+M)

```c++
vector < int > solution(int N, vector< int > &A) {
    int maxCounter = 0;
    int updated = 0;
    vector&lt; int > counters(N,0);
    for(int i = 0;i &lt; A.size(); i++){
        int counterIndex = A[i]-1;
        
        if(counterIndex &lt; N){
            if(counters[counterIndex] &lt; updated)
                counters[counterIndex]=updated+1;
            else
                counters[counterIndex]++;
            maxCounter = max(counters[counterIndex],maxCounter);
        }
        else 
            if (counterIndex==N ){
                updated = maxCounter;
            }
    }
    for(int i=0;i &lt; N;i++){
        if(counters[i] &lt; updated)
            counters[i]=updated;
    }
    return counters;
}
```