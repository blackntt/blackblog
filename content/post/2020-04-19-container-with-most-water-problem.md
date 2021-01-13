---
title: Container With Most Water Problem
author: blackntt
type: post
date: 2020-04-19T14:22:02+00:00
url: /container-with-most-water-problem/
featured_image: /wp-content/uploads/2020/04/My-Post.png
categories:
  - Algorithms
tags:
  - Algorithm
  - algorithms
  - c++
  - container with most water
  - leetcode
  - thuật toán

---
Follow me on :  
&#8211; Youtube: <https://bit.ly/2UIVIAD>  
&#8211; Facebook: <https://bit.ly/2XbMYow>

## Problem

Given&nbsp;_n_&nbsp;non-negative integers&nbsp;_a<sub>1</sub>_,&nbsp;_a<sub>2</sub>_, &#8230;,&nbsp;_a<sub>n&nbsp;</sub>_, where each represents a point at coordinate (_i_,&nbsp;_a<sub>i</sub>_).&nbsp;_n_&nbsp;vertical lines are drawn such that the two endpoints of line&nbsp;_i_&nbsp;is at (_i_,&nbsp;_a<sub>i</sub>_) and (_i_, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.

Cho một dãy số nguyên không âm a1, a2,&#8230;, an. Mỗi số nguyên với ở vị trí i sẽ biểu diễn một điểm ở biểu đồ có toạ độ (i, ai). Tương ứng với mảng số nguyên n phần tử sẽ vẽ tương ứng n cột giữa 2 điểm (i,0) và (i,ai). Yêu cầu tìm 2 cột mà hình chữ nhật tạo bởi 2 cột sau khi hợp với trục ox sẽ có khả năng chứa nhiều nước nhất và xuất ra lượng nước có thể chứa tối đa đó.

Ví dụ

<ul class="wp-block-gallery columns-1 is-cropped">
  <li class="blocks-gallery-item">
    <figure><img src="http://blackblog.net/wp-content/uploads/2020/04/question_11.jpg" alt="" data-id="689" data-link="http://blackblog.net/?attachment_id=689" class="wp-image-689" srcset="https://blackblog.net/wp-content/uploads/2020/04/question_11.jpg 801w, https://blackblog.net/wp-content/uploads/2020/04/question_11-300x143.jpg 300w, https://blackblog.net/wp-content/uploads/2020/04/question_11-768x367.jpg 768w" sizes="(max-width: 801px) 100vw, 801px" /></figure>
  </li>
</ul>

<pre class="wp-block-preformatted"><strong>Input:</strong> [1,8,6,2,5,4,8,3,7]
<strong>Output:</strong> 49</pre>

## Solution

### Giải pháp Brute force:

Độ phức tạp thời gian: 0(n^2)  
Độ phức tạp không gian: O(1)

<pre class="wp-block-prismatic-blocks"><code class="language-cpp">int maxArea(vector&lt; int > &height)
{
    int maxWater = INT_MIN;
    for (int i = 0; i &lt; height.size(); i++)
    {
        for (int j = i+1; j &lt; height.size(); j++)
        {
            int water = min(height[i],height[j])*(j-i);
            maxWater = max(maxWater,water);
        }
        
    }
    return maxWater;
}</code></pre>

### Giải pháp two pointer:

Độ phức tạp thời gian: O(n)  
Độ phức tạp không gian: O(1)

<pre class="wp-block-prismatic-blocks"><code class="language-cpp">int maxArea(vector&lt; int > &height)
{
    int maxWater = INT_MIN;
    int l = 0, r = height.size() - 1;
    while (l &lt; r)
    {
        int water = min(height[l], height[r]) * (r - l);
        maxWater = max(maxWater, water);
        if(height[l] &lt; height[r]){
            l++;
        }else{
            r--;
        }
    }
    return maxWater;
}</code></pre>