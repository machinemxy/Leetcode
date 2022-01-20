// https://leetcode.com/problems/search-in-rotated-sorted-array/

class Solution {
	func search(_ nums: [Int], _ target: Int) -> Int {
		var l = 0
		var r = nums.count - 1

		while l <= r {
			let mid = (l + r) / 2

			if target == nums[mid] {
				return mid
			}

			if nums[mid] == nums[l] {
				// same node
				l = mid + 1
			} else if nums[mid] > nums[l] {
				if target >= nums[l] && target < nums[mid] {
					r = mid - 1
				} else {
					l = mid + 1
				}
			} else {
				if target >= nums[l] || target < nums[mid] {
					r = mid - 1
				} else {
					l = mid + 1
				}
 			}
		}

		return -1
	}
}
