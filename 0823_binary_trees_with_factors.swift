// https://leetcode.com/problems/binary-trees-with-factors/

class Solution {
	static private let modulo = 1000000007

	func numFactoredBinaryTrees(_ arr: [Int]) -> Int {
		if arr.count == 1 { return 1}
		let arr = arr.sorted()
		var dp = Dictionary<Int, Int>()
		dp[arr[0]] = 1

		for i in 1..<arr.count {
			let n = arr[i]
			var count = 1
			for j in 0..<i {
				let n1 = arr[j]
				guard n % n1 == 0 else { continue }
				let n2 = n / n1
				if let count2 = dp[n2] {
					let count1 = dp[n1]!
					count += (count1 * count2 % Self.modulo)
				}
			}
			dp[n] = count % Self.modulo
		}

		return dp.values.reduce(0, +) % Self.modulo
	}
}
