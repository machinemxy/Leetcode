// https://leetcode.com/problems/longest-common-subsequence/description/

class Solution {
	func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
		let array1 = Array(text1)
		let array2 = Array(text2)
		let dpRow = Array(repeating: 0, count: array2.count)
		var dp = Array(repeating: dpRow, count: array1.count)
		let max1id = array1.count - 1
		let max2id = array2.count - 1
		let max12id = max1id + max2id
		for ij in 0...max12id {
			for i in 0...min(ij, max1id) {
				let j = ij - i
				if j > max2id {
					continue
				}
				if array1[i] == array2[j] {
					if i == 0 || j == 0 {
						dp[i][j] = 1
					} else {
						dp[i][j] = dp[i - 1][j - 1] + 1
					}
				} else {
					if i == 0 && j == 0 {
						dp[i][j] = 0
					} else if i == 0 {
						dp[i][j] = dp[i][j - 1]
					} else if j == 0 {
						dp[i][j] = dp[i - 1][j]
					} else {
						dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
					}
				}
			}
		}
		return dp[max1id][max2id]
	}
}
