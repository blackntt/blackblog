---
title: Bài toán chuỗi con đối xứng dài nhất – Longest Palindromic Substring
author: blackntt
type: post
date: 2020-04-03T03:17:54+00:00
url: /bai-toan-chuoi-con-doi-xung-dai-nhat-longest-palindromic-substring/
categories:
  - Algorithms
tags:
  - algorithms
  - leetcode
  - longest palindromic substring

---
## Problem

Đây là bài từng được dùng vào interview của một số công ty như Microsoft, Amazon,&#8230;  
Nội dung: Cho mộtchuỗi kí tự s. Tìm một chuỗi con có kích thước lớn nhất có thể có trong chuỗi ban đầu.

## Solution

### Giải pháp brute force

Ta sẽ duyệt tất cả các chuỗi con có thể có bằng cách dùng hai biến `i,j` lần lượt xác định chỉ số bắt đầu, chỉ số kết thúc của chuỗi con đang xét trong chuỗi ban đầu. Với mỗi chuỗi con đang xét ta so sánh xem hai thứ:  
&#8211; Chuỗi đó có đối xứng hay không  
&#8211; Chuỗi đó có độ dài lớn hơn chuỗi đối xứng trước đó hay không  
Nếu chuỗi con đang xét đối xứng và dài hơn thì lưu lại thông tin của chuỗi con dài hơn.  
Nếu chuỗi con không đối xứng hoặc không dài hơn chuỗi dài nhất trước đó thì bỏ qua và tiếp tục kiểm tra chuỗi mới.  
Độ phức tạp thời gian: O(n^3)  
Độ phức tạp không gian: O(1)  
Mã giả như sau:

<pre class="wp-block-prismatic-blocks"><code class="language-cpp">findLongestPalindrome(s):
  palindromeIndex = 0
  longestLength = 0
  for i from 0 to s.length-1 then
    for j from i to s.length-1 then
      if checkPalindrome(s) is true then
        if s[i->j].length > longestLength then
          longestLength = s[i->j].length
          palindromeIndex = i
   return s.substring(palindromeIndex, longestLength)

checkPalindrome(s):
  for i from 0 to s.length/2 do
    if s[i] is not equal s[s.length - i -1] then
      return false
  return true;</code></pre>

### Giải pháp dynamic programming

### Tabulation

Ta thấy ở giải thuật brute force ở trên, ta thực hiện so sánh tất cả các kí tự của chuỗi con đang xét để xem nó có đối tượng hay không. Thao tác này độ phức tạp O(n). Nhưng ta hoàn toàn có thể giảm độ phức tạp ở việc kiểm tra chuỗi con đối xứng hay không xuống còn O(1) bằng việc sử dụng đặc điểm sau:  
&#8211; Nếu chuỗi đang xét là [i,j] và độ dài bằng 1 thì chắc chắn là chuỗi đối xứng  
&#8211; Nếu chuỗi đang xét là [i,j] với độ dài là 2 và kí tự tại i và tại j là bằng nhau thì chuỗi đối xứng  
&#8211; Nếu chuỗi đang xét có kích thước >=3, kí tự tại i và tại j bằng nhau và chuỗi con [i+1,j-1] đối xứng thì chuỗi [i,j] cũng sẽ đối xứng.  
Với 3 đặc điểm như thế, ta có thể xây dựng một giải thuật mới như sau:  
Độ phức tạp:  
&#8211; Độ phức tạp thời gian: O(n^2)  
&#8211; Độ phức tap không gian: O(n^2)

Mã giả như sau

<pre class="wp-block-prismatic-blocks"><code class="language-cpp">findLongestPalindrome(s):
  palindromeIndex = 0;
  longestLength = 0;
  isPalindrome[s.length,s.length];//2-d array
  for i from 0 to s.length-1 do
    isPalindrome[i,i] = true
    longestLength = 1;

  for i from 0 to s.length - 2 do
    if s[i] == s[i+1] then
      isPalindrome = true
      longestLength = 2;
  
  for length from 3 to s.length do
    for i from 0 to s.length - length do
      j = i + length - 1
      if s=[i] == s[j] then
        if isPalindrome[i+1,j-1] == true then
           isPalindrome[i][j] = true;
           if(length>longestLength) then
             longestLength = length
             palindromeIndex = i

  return s.substring(palindromeIndex, longestLength)</code></pre>

### Center Expansion Algorithm

Giải pháp này cũng xét vào dynamic programming với cùng một tư tưởng tập dụng đúng các đặc điểm như Tabulation ở trên. Nhưng ta thấy một điểm giải pháp trên ta sẽ lưu trữ toàn bộ kết quả của các substring con vào mảng để tái sử dụng. Với giải pháp center expansion thì cũng ta cũng tái sử dụng nhưng ta xét ngay tình huống mở rộng của chuỗi con đối xứng đó ngay mà không cần lưu trữ về sau.  
Giải thuật này sẽ duyệt qua từng kí tự trong chuỗi với mỗi kí tự thì xem nó là tâm của một chuỗi con và cố gắng mở rộng dần về 2 phía của tâm đó cho đến khi nào không mở rộng được nữa thì xem từ tâm đó có thể thành lập được chuỗi con nào dài nhất. Từ đó so sánh các chuỗi con dài nhất từ mỗi tâm mà lưu lại thông tin chuỗi con dài nhất.  
Độ phức tạp thời gian: O(n^2)  
Độ phức tạp không gian: O(1)

<pre class="wp-block-prismatic-blocks"><code class="language-">findLongestPalindrome(s):
	startIndex = 0
	endIndex = 0
	for i from 0 to s.length-1 do
		len1 = expandFromCenter(s, i,i)//odd string
		len2 = expandFromCenter(s,i,i+1)//even string
		len = max(len1,len2)
		if(len>endIndex-startIndex +1) then
			startIndex = i-(len-1)/2
			endIndex = i+len/2
	return s[startIndex->endIndex]
	
expandFromCenter(s,start,end):
	while(start>=0 && end &lt; s.length &#038;&#038; s[start]==s[end])
		start--
		end++
	return end-start+1</code></pre>

## Video hướng dẫn chi tiết

Part 1:<figure class="wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio">

<div class="wp-block-embed__wrapper">
</div></figure> 

Part 2:<figure class="wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio">

<div class="wp-block-embed__wrapper">
</div></figure>