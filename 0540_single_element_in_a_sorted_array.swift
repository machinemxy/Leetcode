// https://leetcode.com/problems/single-element-in-a-sorted-array/description/

class Solution {
	func singleNonDuplicate(_ nums: [Int]) -> Int {
		var l = 0
		var r = nums.count / 2
		while l <= r {
			let mid = (l + r) / 2
			let i = mid * 2
			if i + 1 >= nums.count || nums[i + 1] != nums[i] {
				r = mid - 1
			} else {
				l = mid + 1
			}
		}
		return nums[l * 2]
	}
}
