---
title: '[HackerRank] Left rotation array'
author: blackntt
type: post
date: 2020-02-08T05:33:44+00:00
url: /hackerrank-left-rotation-array/
categories:
  - Algorithms
tags:
  - c++
  - HackerRank

---
# Problem

link: https://www.hackerrank.com/challenges/ctci-array-left-rotation/problem

# Solution

<pre><code class="language-cpp line-numbers">// Complete the rotLeft function below.
vector&lt;int&gt; rotLeft(vector&lt;int&gt; a, int d) {
    vector&lt;int&gt; rotArr(a.size(),0);
    for(size_t i = 0; i &lt; a.size(); i++){
        int newIndex = i - d;
        if (newIndex &lt; 0) {
            newIndex = a.size() + newIndex;
        }
        rotArr[newIndex] = a[i];
    }
    return rotArr;
}

</code></pre>