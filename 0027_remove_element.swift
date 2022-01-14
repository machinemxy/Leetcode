// https://leetcode.com/problems/remove-element/

class Solution {
	func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
		nums = nums.compactMap { $0 == val ? nil : $0 }
		return nums.count
	}
}
