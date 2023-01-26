// https://leetcode.com/problems/cheapest-flights-within-k-stops/description/

class Solution {
	func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
		let dpRow = Array(repeating: Int.max, count: k + 2)
		var dp = Array(repeating: dpRow, count: n)
		for i in 0...(k + 1) {
			dp[src][i] = 0
		}
		for i in 1...(k + 1) {
			for flight in flights {
				let from = flight[0]
				let to = flight[1]
				let distance = flight[2]
				guard dp[from][i - 1] != Int.max else { continue }
				dp[to][i] = min(dp[to][i], dp[from][i - 1] + distance)
			}
		}
		let result = dp[dst][k + 1]
		return result == Int.max ? -1 : result
	}
}
