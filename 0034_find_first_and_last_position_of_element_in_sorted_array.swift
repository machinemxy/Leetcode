// https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/

class Solution {
	private var nums = [Int]()
	private var target = 0

	func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
		self.nums = nums
		self.target = target

		var l = 0
		var r = nums.count - 1
		while l <= r {
			let mid = (l + r) / 2
			if nums[mid] == target {
				let firstTarget = findFirstTarget(l: l, r: mid)
				let lastTarget = findLastTarget(l: mid, r: r)
				return [firstTarget, lastTarget]
			} else if nums[mid] < target {
				l = mid + 1
			} else {
				r = mid - 1
			}
		}
		return [-1, -1]
	}

	private func findFirstTarget(l: Int, r: Int) -> Int {
		var firstTarget = r
		var l = l
		var r = r - 1

		while l <= r {
			let mid = (l + r) / 2
			if nums[mid] == target {
				firstTarget = mid
				r = mid - 1
			} else {
				l = mid + 1
			}
		}

		return firstTarget
	}

	private func findLastTarget(l: Int, r: Int) -> Int {
		var lastTarget = l
		var l = l + 1
		var r = r

		while l <= r {
			let mid = (l + r) / 2
			if nums[mid] == target {
				lastTarget = mid
				l = mid + 1
			} else {
				r = mid - 1
			}
		}

		return lastTarget
	}
}
