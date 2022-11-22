// https://leetcode.com/problems/perfect-squares/

class Solution {
	func numSquares(_ n: Int) -> Int {
		var perfectSquares = [Int]()
		for i in 1...100 {
			let ii = i * i
			if ii > n {
				break
			} else {
				perfectSquares.append(ii)
			}
		}
		var dp = Array(repeating: 0, count: n + 1)
		for i in 1...n {
			var minCount = Int.max
			for j in perfectSquares {
				if j > i { break }
				let count = dp[i - j] + 1
				minCount = min(minCount, count)
			}
			dp[i] = minCount
		}
		return dp[n]
	}
}
