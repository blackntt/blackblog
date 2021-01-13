---
title: Next Permutation Problem
author: blackntt
type: post
date: 2020-04-21T15:45:15+00:00
url: /next-permutation-problem/
featured_image: /wp-content/uploads/2020/04/My-Post.png
categories:
  - Algorithms
tags:
  - Algorithm
  - algorithms
  - Next Permutation

---
Follow me on :  
&#8211; Youtube: <https://bit.ly/2UIVIAD>  
&#8211; Facebook: <https://bit.ly/2XbMYow>

## Problem

Tìm hoán vị lớn liền sau hoán vị đầu vào. Nếu hoán vị hiện tại là lớn nhất thì sẽ quay trở lại hoán vị nhỏ nhất (với các số sắp xếp tăng dần).

Implement&nbsp;**next permutation**, which rearranges numbers into the lexicographically next greater permutation of numbers.  
If such arrangement is not possible, it must rearrange it as the lowest possible order (ie, sorted in ascending order).  
The replacement must be in-placed use only constant&nbsp;extra memory.  
Here are some examples. Inputs are in the left-hand column and its corresponding outputs are in the right-hand column.

`1,2,3`&nbsp;→&nbsp;`1,3,2`  
`3,2,1`&nbsp;→&nbsp;`1,2,3`  
`1,1,5`&nbsp;→&nbsp;`1,5,1`

## Solution:

  * Độ phức tạp thời gian O(n)
  * Độ phức tạp không gian O(1)

```c++
 void nextPermutation(vector&lt; int >& nums) {
        int i = nums.size() - 2;
        while(i >= 0 && nums[i] >= nums[i+1]){
            i--;
        }
        if(i>=0){
            int j = nums.size() - 1;
            while(j>=i && nums[j]&lt;=nums[i]){
                j--;
            }
            if(j>=0)
                swap(nums,i,j);
        }
        i = i+1;
        j = nums.size()-1;
        while(i &lt; j){
            swap(nums,i,j);
            i++;
            j--;
        }
    }
    void swap(vector&lt; int >& nums, int i, int j){
        int temp = nums[i];
        nums[i]=nums[j];
        nums[j]=temp;
    }
```