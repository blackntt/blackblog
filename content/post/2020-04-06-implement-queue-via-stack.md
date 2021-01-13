---
title: Implement Queue via Stack
author: blackntt
type: post
date: 2020-04-06T16:26:57+00:00
url: /implement-queue-via-stack/
featured_image: /wp-content/uploads/2020/04/cover.png
categories:
  - Algorithms
tags:
  - c++
  - data structure
  - queue
  - stack

---
Follow me on : [Youtube][1] &#8211; [Facebook][2]

Đây là một bài cũng thường gặp trong interview vào các công ty công nghệ

## Problem:

Xây dựng cấu trúc dữ liệu Queue bằng Stack

## Solution: 

template < class T >
class Queue{
	private:
		stack< T > s1;
		stack< T > s2;
	public:
		Queue(){}
		void add(T data){
			s1.push(data);
		}
		void remove(){

			shiftStack();
			s2.pop();
		}
		T peek(){
			shiftStack();
			return s2.top();
		}
		bool isEmpty(){
			return s1.empty()&&s2.empty();
		}
		void shiftStack(){
			if(s2.empty()){
				while(!s1.empty()){
					s2.push(s1.top());
					s1.pop();
				}
			}
		}

};
```

 [1]: https://bit.ly/2UIVIAD
 [2]: https://bit.ly/2XbMYow