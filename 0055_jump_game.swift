// https://leetcode.com/problems/jump-game/description/

class Solution {
	func canJump(_ nums: [Int]) -> Bool {
		guard nums.count > 1 else { return true }
		var furthestReachable = 0
		for i in 0..<(nums.count - 1) {
			if i > furthestReachable {
				return false
			}
			let reachable = i + nums[i]
			if reachable >= nums.count - 1 {
				return true
			}
			furthestReachable = max(furthestReachable, reachable)
		}
		return false
	}
}
