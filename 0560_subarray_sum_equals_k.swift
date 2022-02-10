// https://leetcode.com/problems/subarray-sum-equals-k/

class Solution {
	func subarraySum(_ nums: [Int], _ k: Int) -> Int {
		var sum = 0
		var memo = Dictionary<Int, Int>()
		var result = 0

		for num in nums {
			sum += num
			if sum == k {
				result += 1
			}

			let begin = sum - k
			if let value = memo[begin] {
				result += value
			}

			memo[sum] = (memo[sum] ?? 0) + 1
		}

		return result
	}
}
