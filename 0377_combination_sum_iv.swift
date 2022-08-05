// https://leetcode.com/problems/combination-sum-iv/

class Solution {
	private var memo = Dictionary<Int, Int>()
	private var nums = [Int]()

	func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
		memo[0] = 1
		self.nums = nums
		return find(target: target)
	}

	private func find(target: Int) -> Int {
		if let cacheResult = memo[target] {
			return cacheResult
		}

		var result = 0
		for num in nums {
			let newTarget = target - num
			if newTarget >= 0 {
				result += find(target: newTarget)
			}
		}

		memo[target] = result
		return result
	}
}
