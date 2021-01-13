---
title: 'Strings: Making Anagrams'
author: blackntt
type: post
date: 2018-07-28T09:24:15+00:00
url: /strings-making-anagrams/
categories:
  - Algorithms

---
Đề gốc là bài [ **Strings: Making Anagrams**][1] của **RackerRank**

Tóm tắt

Đầu vào 2 chuỗi String a, b:

Viết hàm makeAnangram với đầu ra số lượng kí tự tối thiểu cần xóa ở 2 chuỗi để cho 2 chuỗi đó có cùng danh sách các loại kí tự và số lượng kí tự của từng loại

Solution- Java code:

<pre class="theme:eclipse lang:default decode:true">static int makeAnagram(String a, String b) {
        ArrayList chars = new ArrayList();
        ArrayList frq1 = new ArrayList();
        ArrayList frq2 = new ArrayList();
        extracted(a, chars, frq1,frq2);
        extracted(b, chars, frq2,frq1);
        int changeCount = 0;
        for (int i = 0; i &lt; chars.size(); i++) {
            if(frq1.get(i)!=frq2.get(i)) {
                changeCount +=Math.abs( frq1.get(i)-frq2.get(i));
            }
        }
        return changeCount;

    }
    private static void extracted(String a, ArrayList chars, ArrayList frq1, ArrayList frq2) {
        for(int i=0;i&lt;a.length();i++){
            if(!chars.contains(a.charAt(i))){
                chars.add(a.charAt(i));
                frq1.add(1);
                frq2.add(0);
            }else{
                int index = chars.indexOf(a.charAt(i));
                frq1.set(index, frq1.get(index)+1);
            }
        }
    }</pre>

 [1]: https://www.hackerrank.com/challenges/ctci-making-anagrams/problem