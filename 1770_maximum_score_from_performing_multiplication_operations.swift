// https://leetcode.com/problems/maximum-score-from-performing-multiplication-operations/

class Solution {
	func maximumScore(_ nums: [Int], _ multipliers: [Int]) -> Int {
		let dpRow = Array(repeating: 0, count: multipliers.count)
		var dp = Array(repeating: dpRow, count: multipliers.count)

		for window in stride(from: multipliers.count - 1, through: 0, by: -1) {
			for i in 0...window {
				let j = window - i
				if window == multipliers.count - 1 {
					dp[i][j] = max(nums[i] * multipliers[window], nums[nums.count - 1 - j] * multipliers[window])
				} else {
					dp[i][j] = max(nums[i] * multipliers[window] + dp[i + 1][j], nums[nums.count - 1 - j] * multipliers[window] + dp[i][j + 1])
				}
			}
		}

		return dp[0][0]
	}
}
