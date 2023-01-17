// https://leetcode.com/problems/flip-string-to-monotone-increasing/description/

class Solution {
	func minFlipsMonoIncr(_ s: String) -> Int {
		let a = Array(s)
		guard a.count > 1 else { return 0 }
		let dpLine = Array(repeating: 0, count: 2)
		var dp = Array(repeating: dpLine, count: a.count)
		if a[0] == "0" {
			dp[0][0] = 0
			dp[0][1] = 1
		} else {
			dp[0][0] = 1
			dp[0][1] = 0
		}
		for i in 1..<a.count {
			if a[i] == "0" {
				dp[i][0] = dp[i - 1][0]
				dp[i][1] = min(dp[i - 1][0], dp[i - 1][1]) + 1
			} else {
				dp[i][0] = dp[i - 1][0] + 1
				dp[i][1] = min(dp[i - 1][0], dp[i - 1][1])
			}
		}
		return min(dp[a.count - 1][0], dp[a.count - 1][1])
	}
}
