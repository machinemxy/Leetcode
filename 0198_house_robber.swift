// https://leetcode.com/problems/house-robber/description/

class Solution {
	func rob(_ nums: [Int]) -> Int {
		if nums.count == 1 {
			return nums[0]
		} else if nums.count == 2 {
			return max(nums[0], nums[1])
		}
		var dp = Array(repeating: 0, count: nums.count)
		dp[0] = nums[0]
		dp[1] = max(nums[0], nums[1])
		for i in 2..<nums.count {
			dp[i] = max(dp[i - 1], dp[i - 2] + nums[i])
		}
		return dp[nums.count - 1]
	}
}
