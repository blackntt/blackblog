---
title: '[Algorithms] Phân tích độ phức tạp thuật toán'
author: blackntt
type: post
date: 2020-02-15T15:44:31+00:00
url: /algorithms-phan-tich-do-phuc-tap-thuat-toan/
categories:
  - Algorithms
tags:
  - algorithms
  - big O
  - đọ phức tạp
  - time complexity

---
Nhận dạng độ phức tạp tính toán (time complexity) của thuật toán:  
&#8211; O(1): nếu đoạn code không có vòng lặp, đệ quy (recursion) và gọi các hàm có độ phức tạp khác hằng số  
&#8211; O(n): nếu đoạn code có chứa một vòng lặp, và trong vòng lặp chỉ gọi các hàm có độ phức tạp O(1)  
&#8211; O(n^k): nếu đoạn code có chứa các vòng lặp lồng vào nhau  
&#8211; O(logn): nếu đoạn code có chứa vòng lặp, và biến tăng nhân/chia cho hằng số.  
&#8211; O(loglogn): nếu đoạn code có chứa vòng lặp, và biến tăng thay đổi bởi bằng phép lũy thừa.

<pre><code class="line-numbers">   for (int i = 2; i &lt;=n; i = pow(i, c)) { 
       // some O(1) expressions
   }
</code></pre>

i sẽ nhận lần lượt các hệ số: 2, 2^c, 2^(c^2),&#8230;,2^(c^k) và i <= n nên 2^(c^k)<=n &#8211;> k <= logc(logn) &#8211;> O(loglogn)  
Next Post: Tính độ phức tạp của các thuật toán đệ quy (update later)