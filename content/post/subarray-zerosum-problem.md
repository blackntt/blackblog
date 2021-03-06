---
title: "Subarray Zerosum Problem"
date: 2021-03-06T21:48:31+07:00
categories:
  - Algorithms
---
## Subarray Zero Sum problem
Bài toán này cho một mảng `arr` các số nguyên. Yêu cầu kiểm tra liệu `arr` có tồn tại mảng con nào mà nó có tổng của các phần tử là 0.
## Lời giải:
```Go
func hasSubArrZeroSum(arr []int) bool {
	preSum := make(map[int]bool)
	preSum[0] = true
	sum := 0
	for _, v := range arr {
		sum += v
		if _, isExisted := preSum[sum]; isExisted {
			return true
		}
		preSum[sum] = true
	}
	return false
}
func main() {
	arr := []int{3, 4, -7, 3, 1, 3, 1, -4, -2, -2}
	fmt.Printf("Result: %v", hasSubArrZeroSum(arr))
}
```
