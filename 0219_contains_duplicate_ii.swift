// https://leetcode.com/problems/contains-duplicate-ii/

class Solution {
	func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
		var l = 0
		var set = Set<Int>()
		for r in nums.indices {
			let num = nums[r]
			if set.contains(num) {
				return true
			}
			set.insert(num)
			if r - l == k {
				set.remove(nums[l])
				l += 1
			}
		}
		return false
	}
}
