// https://leetcode.com/problems/matchsticks-to-square/

class Solution {
	private var sortedMatchSticks = [Int]()

	func makesquare(_ matchsticks: [Int]) -> Bool {
		let totalLength = matchsticks.reduce(0, +)
		if totalLength % 4 != 0 { return false }
		let lengthEachSide = totalLength / 4
		sortedMatchSticks = matchsticks.sorted(by: >)
		if sortedMatchSticks[0] > lengthEachSide { return false }

		var restLengths = Array(repeating: lengthEachSide, count: 4)
		restLengths[0] -= sortedMatchSticks[0]
		let result = canFill(index: 1, restLengths: restLengths)
		return result
	}

	private func canFill(index: Int, restLengths: [Int]) -> Bool {
		if index == sortedMatchSticks.count { return true }
		let currentLength = sortedMatchSticks[index]
		for i in 0...3 {
			if currentLength <= restLengths[i] {
				var restLengths = restLengths
				restLengths[i] -= currentLength
				let restResult = canFill(index: index + 1, restLengths: restLengths)
				if restResult {
					return true
				}
			}
		}
		return false
	}
}
