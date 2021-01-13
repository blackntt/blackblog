---
title: Decode Ways Problems
author: blackntt
type: post
date: 2020-05-03T06:12:38+00:00
url: /decode-ways-problems/
featured_image: /wp-content/uploads/2020/04/My-Post.png
newsium-meta-content-alignment:
  - align-content-left
categories:
  - Algorithms
tags:
  - Algorithm
  - algorithms
  - c++
  - data structure

---
## Problem

Cho một chuỗi số N kí tự. Tìm số cách có thể giải mã chuỗi số đó. Biết bảng mã hoá như sau: A -> 1, B -> 2, &#8230;, Z -> 26. 

Ví dụ &#8220;226&#8221; &#8211; kết quả là 3 vì (2|26, 22|6, 2|2|6) &#8211; 3 cách có thể giải mã.

## Solution:

#### Media

#### Dynamic programming

Độ phức tạp thời gian: O(n)  
Độ phức tạp không gian: O(n)

```c++ int numDecodings(string s) {
        vector&lt; int > dp(s.length()+1,0);
        dp[s.length()]=1;
        if(s[s.length()-1] >= '1'&&s[s.length()-1] &lt;= '9'){
                dp[s.length()-1]=1;
        }
        int i=s.length()-2;
        while(i>=0){
            int ways = 0;
            if(i+1&lt;s.length() &#038;&#038; (s[i] == '1'||(s[i] == '2' &#038;&#038; s[i+1] &lt;= '6'))){
                ways=dp[i+2];
            }
            if(s[i] >= '1' && s[i] &lt;= '9'){
                ways += dp[i+1];
            }
            dp[i] = ways;
            i--;
        }
        return dp[0];
    }
```