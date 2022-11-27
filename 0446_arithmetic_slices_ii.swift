// https://leetcode.com/problems/arithmetic-slices-ii-subsequence/

class Solution {
    func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
        var result = 0
        var dp = Array(repeating: [Int: Int](), count: nums.count)
        for i in 1..<nums.count {
            for j in 0..<i {
                let diff = nums[j] - nums[i]
                dp[i][diff, default: 0] += dp[j][diff, default: 0] + 1
                result += dp[j][diff, default: 0]
            }
        }
        return result
    }
}
