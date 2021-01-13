---
title: '[HackerRank] Max Array Sum'
author: blackntt
type: post
date: 2020-02-24T16:29:24+00:00
url: /hackerrank-max-array-sum/
categories:
  - Algorithms
tags:
  - dynamic programming
  - HackerRank

---
# Problem

Link: https://www.hackerrank.com/challenges/max-array-sum/problem  
**Mô tả vắn tắt:  
Cho một mảng gồm các số nguyên. Tìm tổng lớn nhất của các tập con tạo nên từ mảng ban đầu với điều kiện không có phần tử liền kề.**

# Solution

[Giải với Dynamic programming]

<pre><code class="language-cpp line-numbers">// Complete the maxSubsetSum function below.
int maxSubsetSum(vector&lt;int&gt; arr) {
    vector&lt;long&gt; maxArr(arr.size(),0);
    maxArr[0]=arr[0]&gt;0?arr[0]:0;
    maxArr[1]= arr[1]&gt;maxArr[0]? arr[1]:maxArr[0];
    for(size_t i=2;i&lt;arr.size();i++){
        if(arr[i]+maxArr[i-2]&gt;maxArr[i-1]){
            maxArr[i]=arr[i]+maxArr[i-2];
        }else{
            maxArr[i]=maxArr[i-1];
        }
    }
    return maxArr[arr.size()-1];

}
</code></pre>