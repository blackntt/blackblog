---
title: '[HackerRank] Sherlock and Cost'
author: blackntt
type: post
date: 2020-03-07T16:18:39+00:00
url: /hackerrank-sherlock-and-cost/
categories:
  - C++
tags:
  - c++
  - dynamic programming
  - HackerRank

---
# Problem

https://www.hackerrank.com/challenges/sherlock-and-cost/problem

# Solution

Use by dynamic programming:

<pre><code class="language-cpp line-numbers">long cost(vector&lt;int&gt; B) {
    map&lt;pair&lt;int,int&gt;, long&gt; v;
    long v1 = 0;
    long v2 = 0;
    for(int stage = 1; stage &lt;  B.size();stage ++){
            int a = 1;
            int b =  B[ B.size()-stage-1];
            int d1 = 1;
            int d2 = B[ B.size() - stage ] ;
            long vad1 = abs(d1-a)+v1;
            long vad2 = abs(d2-a)+v2;
            long vbd1 = abs(d1-b)+v1;
            long vbd2 = abs(d2-b)+v2;
            v1 = max(vad1,vad2);
            v2 = max(vbd1,vbd2); 
    }
    return max(v1, v2);
}
</code></pre>