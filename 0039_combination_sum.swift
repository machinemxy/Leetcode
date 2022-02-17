// https://leetcode.com/problems/combination-sum/

class Solution {
	private var sortedCandidates = [Int]()

	func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
		let sortedCandidates = candidates.sorted()
		return combination(sortedCandidates, target)
	}

	private func combination(_ sortedCandidates: [Int], _ target: Int) -> [[Int]] {
		var result = [[Int]]()

		var sortedCandidates = sortedCandidates

		while sortedCandidates.count > 0 {
			let candidate = sortedCandidates.first!

			if target < candidate {
				break
			} else if target == candidate {
				result.append([candidate])
				break
			} else {
				let rest = target - candidate
				let restResult = combinationSum(sortedCandidates, rest)
				result += restResult.map({
					var temp = $0
					temp.insert(candidate, at: 0)
					return temp
				})
			}

			sortedCandidates.removeFirst()
		}

		return result
	}
}
