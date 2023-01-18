// https://leetcode.com/problems/maximum-sum-circular-subarray/description/

class Solution {
	func maxSubarraySumCircular(_ nums: [Int]) -> Int {
		var curMax = 0
		var curMin = 0
		var sumMax = nums[0]
		var sumMin = nums[0]
		var sum = 0
		for num in nums {
			curMax = max(curMax, 0) + num
			curMin = min(curMin, 0) + num
			sumMax = max(sumMax, curMax)
			sumMin = min(sumMin, curMin)
			sum += num
		}
		return sum == sumMin ? sumMax : max(sumMax, sum - sumMin)
	}
}
