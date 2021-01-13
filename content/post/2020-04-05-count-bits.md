---
title: Count bits
author: blackntt
type: post
date: 2020-04-05T15:35:28+00:00
url: /count-bits/
categories:
  - Algorithms
tags:
  - Algorithm
  - algorithms
  - c++
  - count bits
  - interview question

---
Đây là bài toán nằm trong series về giải thuật và interview ở các công ty công nghệ.

Follow me on : [][1][][1][Youtube][1] &#8211; [Facebook][2]

## Problem

Đây là một bài toán được xếp ở mức medium trên các trang về chia sẽ đề interview của các công ty công nghệ vì thường khi interview sẽ được yêu cầu tối ưu (thường sẽ dừng ở mức giải quyết bằng dynamic programming)

**Đề: Cho số n. Xuất ra kết quả là một mảng a với mỗi phần tử a[i] là số lượng bits 1 có trong số có giá trị bằng i. với 0<=i<=n.  
** _**Given a non negative integer number&nbsp;num. For every numbers&nbsp;i&nbsp;in the range&nbsp;0 ≤ i ≤ num&nbsp;calculate the number of 1&#8217;s in their binary representation and return them as an array.**_

<pre class="wp-block-preformatted">Example
<strong>Input: </strong>5
<strong>Output: </strong><code>[0,1,1,2,1,2]</code></pre>

## Solution

**Basic solution**: Giải pháp dễ nhất có thể nghĩ đến là đếm từng bits 1 của số đang cần đếm:  
&#8211; Độ phức tạp thời gian: O(n*m) với m là số bits dùng để biểu diễn cho số n đầu vào  
&#8211; Độ phức tạp không gian: O(n)  
Nhưng thường khi phỏng vấn ở các công ty công nghệ (google, amazon,&#8230;) thì câu này sẽ yêu cầu tối ưu về thời gian nên thường giải pháp này không được chọn. Nên xem xét giải pháp tốt hơn như dynamic programming bên dưới

<pre class="wp-block-prismatic-blocks"><code class="language-">int countOnes(int num){
        int count = 0;
        while(num >0){
            count +=(num & 1);
            num=num>>1;
        }
        return count;
    }
 vector &lt; int > countBits(int num){
        vector &lt; int > bits(num+1);
        for(int i=0;i&lt;=num;i++){
            bits[i] = countOnes(i);
        }
        return bits;
 }</code></pre>

**Giải pháp với dynamic programming:**  
- Độ phức tạp thời gian: O(n)  
- Độ phức tạp không gian: O(n)<figure class="wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio">

<div class="wp-block-embed__wrapper">
</div></figure> 

```c++ vector < int > countBits(int num){
        vector< int > bits(num+1);
        bits[0] = 0;
        for(int i=1;i&lt;=num;i++){
            if(i&#038;1) bits[i]=bits[i-1]+1;
            else
                bits[i]=bits[i>>1];
        }
        return bits;
    }
  ```

 [1]: https://bit.ly/2UIVIAD
 [2]: https://bit.ly/2XbMYow