// https://leetcode.com/problems/longest-increasing-subsequence/

class Solution {
	func lengthOfLIS(_ nums: [Int]) -> Int {
		var stack = [Int]()

		for num in nums {
			if stack.isEmpty {
				stack.append(num)
			} else if num > stack.last! {
				stack.append(num)
			} else {
				var l = 0
				var r = stack.count - 1
				while l <= r {
					let mid = (l + r) / 2
					let midVal = stack[mid]
					if num <= midVal {
						r = mid - 1
					} else {
						l = mid + 1
					}
				}
				stack[l] = num
			}
		}

		return stack.count
	}
}
