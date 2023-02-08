// https://leetcode.com/problems/jump-game-ii/description/

class Solution {
	func jump(_ nums: [Int]) -> Int {
		var minPosition = 0
		var maxPosition = 0
		var steps = 0
		while maxPosition < nums.count - 1 {
			steps += 1
			var nextMinPosition = maxPosition + 1
			var nextMaxPosition = maxPosition
			for i in minPosition...maxPosition {
				nextMaxPosition = max(nextMaxPosition, i + nums[i])
			}
			minPosition = nextMinPosition
			maxPosition = nextMaxPosition
		}
		return steps
	}
}
