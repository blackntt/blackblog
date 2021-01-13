---
title: '[HackerRank] Minimum Swaps 2'
author: blackntt
type: post
date: 2020-02-06T13:16:52+00:00
url: /hackerrank-minimum-swaps-2/
categories:
  - Algorithms
tags:
  - c++
  - HackerRank
  - Minimum Swaps

---
Minimum Swaps 2

# Problem

Link: https://www.hackerrank.com/challenges/minimum-swaps-2

# Solution

<pre><code class="language-cpp line-numbers">// Complete the minimumSwaps function below.
int minimumSwaps(vector&lt;int&gt; arr) {

    pair&lt;int,int&gt; arrPos[arr.size()];
    for(size_t i = 0;i&lt;arr.size();i++){
        arrPos[i].first = arr[i];
        arrPos[i].second = i;
    }

    sort(arrPos, arrPos + arr.size());

    int minSwap = 0;

    vector&lt;bool&gt; visit(arr.size(),false);

    for(size_t i = 0;i &lt; arr.size();i++){

        if(visit[i] || arrPos[i].second == i){
            continue;
        }
        int cycle_size = 0;
        int j = i;
        while(!visit[j]){
            visit[j]=true;
            j = arrPos[j].second;
            cycle_size++;
        }

        if (cycle_size &gt; 1){
            minSwap +=cycle_size - 1;
        }
    }

    return minSwap;

}
</code></pre>