// https://leetcode.com/problems/two-city-scheduling/

class Solution {
	func twoCitySchedCost(_ costs: [[Int]]) -> Int {
		let sortedCosts = costs.sorted { l, r in
			(l[0] - l[1]) <= (r[0] - r[1])
		}

		let halfCount = sortedCosts.count / 2
		var result = 0
		for i in 0..<sortedCosts.count {
			if i < halfCount {
				result += sortedCosts[i][0]
			} else {
				result += sortedCosts[i][1]
			}
		}

		return result
	}
}
