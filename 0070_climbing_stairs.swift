// https://leetcode.com/problems/climbing-stairs/description/

class Solution {
	func climbStairs(_ n: Int) -> Int {
		guard n > 1 else { return 1 }
		var dp = Array(repeating: 1, count: n + 1)
		for i in 2...n {
			dp[i] = dp[i - 1] + dp[i - 2]
		}
		return dp[n]
	}
}
