---
title: Bài toán tổng 2 số | two sum Problem
author: blackntt
type: post
date: 2020-03-26T15:37:23+00:00
url: /leetcodetwo-sum-problem/
categories:
  - Algorithms
tags:
  - leetcode
  - two-sum problem

---
# Problem

Cho mảng gồm các số nguyên. Tìm 2 phần tử mà tổng của chúng bằng một số cho trước. Giả sử rằng một phần tử không dùng 2 lần, và chỉ có 1 cặp số trong mảng thoả điều kiện về tổng. [problem link][1]{.wp-editor-md-post-content-link}

# Solution

  * 1st solution:  
    Với mỗi phần tử trong mảng thì duyệt toàn mảng tìm một phần tử khác trong mảng để tổng của chúng bằng target mong muốn.  
    Time complexity: O(n^2)

<pre><code class="language-cpp line-numbers">vector&lt;int&gt; twoSum(vector&lt;int&gt;& nums, int target) {
        vector&lt;int&gt; result;
        for (int i=0;i&lt;nums.size()-1;i++){
            for(int j=i+1;j&lt;=i+1;j++){
                if(nums[i]+nums[j]==target){
                    result.push_back(i);
                    result.push_back(j);
                    break;
                }
            }
        }
        return result;
}
</code></pre>

  * 2nd solution  
    Tương tự ý tưởng giải pháp 1, nhưng giải time complexity bằng hash table. Duyệt từng phần tử trong mảng rồi tìm một phần tử bù (tổng-giá trị phần tử đang xét) trong hash table để giải time complexity.  
    Time complexity: gần O(n)

<pre><code class="language-cpp line-numbers">vector&lt;int&gt; twoSum(vector&lt;int&gt;& nums, int target) {
        vector&lt;int&gt; result;
        map&lt;int,int&gt; hashMap;
        for(int i=0;i&lt; nums.size();i++){
            hashMap[nums[i]]=i;
        }
        for(int i=0;i&lt;nums.size();i++){
            map&lt;int,int&gt;::iterator it = hashMap.find(target-nums[i]);
            if(it!=hashMap.end()){
                result.push_back(i);
                result.push_back(it-&gt;second);
                break;
            }
        }
        return result;
    }
</code></pre>

  * 3rd solution  
    Tương tự giải pháp 2, nhưng tìm phần bù của số đang duyệt ngay trong vòng lặp tạo hash table.  
    Time complexity: gần O(n) (tốt hơn giải pháp 2)

<pre><code class="language-cpp line-numbers"> vector&lt;int&gt; twoSum(vector&lt;int&gt;& nums, int target) {
        vector&lt;int&gt; result;
        map&lt;int,int&gt; hashMap;
        for(int i=0;i&lt; nums.size();i++){
            map&lt;int,int&gt;::iterator it = hashMap.find(target-nums[i]);
            if(it!=hashMap.end()){
                result.push_back(i);
                result.push_back(it-&gt;second);
                break;
            }
            hashMap[nums[i]]=i;
        }

        return result;
}
</code></pre>

 [1]: https://leetcode.com/problems/two-sum