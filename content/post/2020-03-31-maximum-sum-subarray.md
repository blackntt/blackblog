---
title: Maximum sum subarray
author: blackntt
type: post
date: 2020-03-31T03:58:38+00:00
url: /maximum-sum-subarray/
categories:
  - Algorithms
tags:
  - maximum sum subarry

---
<figure class="wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio">

<div class="wp-block-embed__wrapper">
</div></figure> 

# Problem

Đây là một bài toán khá phổ biến ở các trang về thuật toán, xếp loại medium, nó là cơ sở của nhiều bài được các công ty công nghệ sử dụng cho interview.  
Đề bài:  
Cho một mảng gồm N phần tử arr = [1, -2, 3, 4]. Tìm tổng lớn nhất có thể tạo ra từ các subarray của mảng arr ban đầu.

<span style="color: #2b2b2b; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif; font-size: 2em;">Solution</span>

  * Brute force solution  
    Đây là giải thuật toán đơn giản nhất đề cài đặt cho bài toán nhưng độ phức tạp khá lớn không thể chạy được các input với size lớn khi test performance trong các bài interview.

<pre><code class="language-cpp line-numbers hljs">findMaxSubArray(arr):
    maxSum = &lt;span class="hljs-number">0&lt;/span>
    &lt;span class="hljs-keyword">for&lt;/span> i from &lt;span class="hljs-number">0&lt;/span> to arr.length - &lt;span class="hljs-number">1&lt;/span> &lt;span class="hljs-keyword">do&lt;/span>
        &lt;span class="hljs-keyword">for&lt;/span> j from i to arr.length &lt;span class="hljs-number">-1&lt;/span> &lt;span class="hljs-keyword">do&lt;/span>
            maxSum =max(maxSum, sum(arr[i-&gt;j]))
    &lt;span class="hljs-keyword">return&lt;/span> maxSum
</code></pre>

Với giải thuật như trên thì độ phức tạp rơi vào lớp O(n^3)

  * Giải thuật kadane  
    Giải thuật này có ý tưởng như sau với mỗi arr[i] thì ta sẽ xem xét arr[i] này sẽ từ nó tạo ra một array mới để kiểm tra hay là gắng nó vào subarray trước đó. Và quyết định sẽ phụ thuộc vào arr[i] có làm tăng sum của subarray đang xây dựng ngay trước nó hay không. Nếu arr[i] làm giảm giá trị của subarray trước đó thì ta sẽ xét đến array mới arr[i] là giá trị đâù tiên và kiểm tra sum của subarray mới có lớn hơn max sum lớn nhất đang lưu trữ hiện tại hay không và cập nhật lại max sum. Trong tình huống, arr[i] trờ thành đuôi của subarray đang dựng trước đó thì kiểm tra sum của subarray mà arr[i] tham gia vào so với max sum để cập nhật max sum.

<pre><code class="language-cpp line-numbers hljs">findMaxSubArray(arr):
    globalSum = arr[&lt;span class="hljs-number">0&lt;/span>]&lt;span class="hljs-comment">//max sum&lt;/span>
    curSum = arr[&lt;span class="hljs-number">0&lt;/span>]
    &lt;span class="hljs-keyword">for&lt;/span> i from &lt;span class="hljs-number">1&lt;/span> to arr.length &lt;span class="hljs-number">-1&lt;/span> &lt;span class="hljs-keyword">do&lt;/span>
        curSum = max(curSum + arr[i], arr[i])
        globalSum = max(globalSum, curSum)
    &lt;span class="hljs-keyword">return&lt;/span> globalSum
</code></pre>

Và độ phức tạp về thơi gian của giải thuật này là o(n)