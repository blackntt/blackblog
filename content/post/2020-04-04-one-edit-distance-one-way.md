---
title: One edit distance – One way
author: blackntt
type: post
date: 2020-04-04T16:13:04+00:00
url: /one-edit-distance-one-way/
categories:
  - Algorithms
tags:
  - Algorithm
  - algorithms
  - c++
  - one distance
  - one edit distance
  - one-way

---
 

## Problem

Cho 2 chuỗi s1, s2. Viết hàm kiểm tra xem s1 và s2 có phải chỉ khác biệt tối đa 1 thao tác chỉnh sửa (thêm, sửa hoặc xoá 1 kí tự)

## Solution

  * Độ phức tạp thời gian: O(n)
  * Độ phức tạp không gian: O(1)

<pre class="wp-block-prismatic-blocks"><code class="language-cpp">bool isOneWay(string s1, string s2){
	int maxLen = max(s1.length(),s2.length());
	int diff = 0;
	for(int i=0;i &lt; maxLen ;i++){
		if (diff== 0){
			if (s1[i] !=s2[i]){
				diff++;
			}
		}else{
			if(s1.length()!=s2.length()){
				if (s1[i] != s2[i-diff] ){
					return false;
				}
			}else{
				if (s1[i] != s2[i]){
					return false;
				}
			}
			
		}
	}
	return true;
}</code></pre>