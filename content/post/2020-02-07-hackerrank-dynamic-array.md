---
title: '[HackerRank] Dynamic Array'
author: blackntt
type: post
date: 2020-02-07T08:01:46+00:00
url: /hackerrank-dynamic-array/
categories:
  - Algorithms
tags:
  - c++
  - dynamic-array
  - HackerRank

---
Dynamic Array

# Problem

https://www.hackerrank.com/challenges/dynamic-array/problem

# Solution

<pre><code class="language-cpp line-numbers">vector&lt;int&gt; dynamicArray(int n, vector&lt;vector&lt;int&gt;&gt; queries) {
    vector&lt;int&gt; answers;
    int lastAnswer = 0;
    vector&lt;vector&lt;int&gt;&gt; seqs(n,vector&lt;int&gt;());

    for (size_t i = 0; i &lt; queries.size(); i++) {
        int query_type = queries[i][0];
        int x = queries[i][1];
        int y = queries[i][2];
        int seqIndex = (x^lastAnswer)%n;
        if(query_type == 1){
            seqs[seqIndex].push_back(y);
        }else if (query_type == 2) {
            lastAnswer = seqs[seqIndex][y % seqs[seqIndex].size()];
            answers.push_back(lastAnswer);
        }

    }
    return answers;
}
</code></pre>