// https://leetcode.com/problems/kth-largest-element-in-an-array/

class Solution {
	func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
		var stack = [Int]()

		for num in nums {
			if stack.isEmpty {
				stack.append(num)
			} else if stack.count == k && num <= stack.last! {
				continue
			} else {
				var l = 0
				var r = stack.count - 1
				while l <= r {
					let mid = (l + r) / 2
					let midVal = stack[mid]
					if num == midVal {
						l = mid
						break
					} else if num > midVal {
						r = mid - 1
					} else {
						l = mid + 1
					}
				}

				stack.insert(num, at: l)
				if stack.count > k {
					stack.removeLast()
				}
			}
		}

		return stack.last!
	}
}
