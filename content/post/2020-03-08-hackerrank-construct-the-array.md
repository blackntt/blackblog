---
title: '[HackerRank]  Construct the Array'
author: blackntt
type: post
date: 2020-03-08T10:51:52+00:00
url: /hackerrank-construct-the-array/
categories:
  - Algorithms
tags:
  - c++
  - dynamic programming
  - HackerRank

---
# Problem

Link: https://www.hackerrank.com/challenges/construct-the-array/problem

# Solution

Giaỉ pháp với dynamic programming:  
&#8211; Giải pháp này bị hạn chế về space complexity O(k*n)

<pre><code class="language-cpp line-numbers"> long v[k+1][n];
    for (int i=1; i&lt;=k; i++) {
        v[i][0] = 0l;
        v[i][1] = 1l ;
    }
    v[x][0]= 1l;
    v[x][1]= 0l;
    for(int stage=2;stage&lt;n;stage++){
        for (int i=1; i&lt;=k; i++) {
            long vmax = 0l;
            for (int j=1;j&lt;=k;j++){
                if (i!=j ){
                    vmax = (vmax+(v[j][stage-1]));
                }
            }
            v[i][stage]= vmax%1000000007;
        }
    }    
    return v[1][n-1];
</code></pre>

  * Giải pháp 2: giải quyết về vấn đề space complexity O(n):

<pre><code class="language-cpp line-numbers">    long v[3][n];
    for (int i=1; i&lt;=2; i++) {
        v[i][0] = 0;
        v[i][1] = 1 ;
    }
    v[2][0]= 1;
    v[2][1]= 0;
    int stage = 0;
    for( stage=2;stage&lt;n;stage++){
        v[1][stage]=((k-2)*v[1][stage-1]+v[2][stage-1])%1000000007;
        v[2][stage]=((k-1)*v[1][stage-1])%1000000007;
    }    

    return x==1?v[2][n-1]:v[1][n-1];
</code></pre>