// https://leetcode.com/problems/contiguous-array/

class Solution {
	func findMaxLength(_ nums: [Int]) -> Int {
		let nums = nums.map { $0 == 0 ? -1 : 1 }
		var maxLength = 0
		var dic: Dictionary<Int, Int> = [0: -1]
		var sum = 0

		for i in 0..<nums.count {
			sum += nums[i]
			if let firstId = dic[sum] {
				maxLength = max(maxLength, i - firstId)
			} else {
				dic[sum] = i
			}
		}
		return maxLength
	}
}
