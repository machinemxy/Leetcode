// https://leetcode.com/problems/split-array-largest-sum/

class Solution {
	private var nums = [Int]()
	private var m = 0

	func splitArray(_ nums: [Int], _ m: Int) -> Int {
		self.nums = nums
		self.m = m

		var l = 0
		var r = 0
		for num in nums {
			l = max(l, num)
			r += num
		}

		while l <= r {
			let mid = (l + r) / 2
			if canSolve(limit: mid) {
				r = mid - 1
			} else {
				l = mid + 1
			}
		}

		return l
	}

	private func canSolve(limit: Int) -> Bool {
		var container = 1
		var sum = 0
		for num in nums {
			if sum + num <= limit {
				sum += num
			} else {
				if container == m {
					return false
				} else {
					container += 1
					sum = num
				}
			}
		}
		return true
	}
}
