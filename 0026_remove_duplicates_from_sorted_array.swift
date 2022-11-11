// https://leetcode.com/problems/remove-duplicates-from-sorted-array/

class Solution {
	func removeDuplicates(_ nums: inout [Int]) -> Int {
		var prev = Int.max
		for i in stride(from: nums.count - 1, through: 0, by: -1) {
			if nums[i] == prev {
				nums.remove(at: i)
			} else {
				prev = nums[i]
			}
		}
		return nums.count
	}
}
