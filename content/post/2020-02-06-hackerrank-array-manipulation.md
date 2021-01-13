---
title: '[HackerRank] Array Manipulation'
author: blackntt
type: post
date: 2020-02-06T14:38:21+00:00
url: /hackerrank-array-manipulation/
categories:
  - Algorithms
tags:
  - array manipulation
  - c++
  - HackerRank

---
Array Manipulation

# Problem

link: https://www.hackerrank.com/challenges/crush/problem

# Solution

<pre><code class="language-cpp line-numbers">// Complete the arrayManipulation function below.
long arrayManipulation(int n, vector&lt;vector&lt;int&gt;&gt; queries) {
    vector&lt;long&gt; addArr(n,0);

    long max = 0;
    for (size_t i = 0; i&lt;queries.size(); i++) {
        int a = queries[i][0]-1;
        int b = queries[i][1]-1;
        int k = queries[i][2];
        addArr[a] +=k;
        if ((b+1) &lt;= n-1) addArr[b+1] -=k;
    }
    long tempMax = 0;
    for (size_t i = 0; i &lt; n; i++){
        tempMax =tempMax+addArr[i];
        if (max &lt;tempMax) max = tempMax;
    }
    return max;

}

</code></pre>