// https://leetcode.com/problems/decode-ways/

class Solution {
    func numDecodings(_ s: String) -> Int {
        let nums = s.map { Int(String($0))! }
        guard nums.count > 1 else { return nums[0] == 0 ? 0 : 1 }
        var dp = Array(repeating: 0, count: nums.count + 1)
        dp[nums.count] = 1
        dp[nums.count - 1] = nums.last! == 0 ? 0 : 1
        for i in stride(from: nums.count - 2, through: 0, by: -1) {
            if nums[i] == 1 || (nums[i] == 2 && nums[i + 1] <= 6) {
                dp[i] = dp[i + 1] + dp[i + 2]
            } else if nums[i] == 0 {
                dp[i] = 0
            } else {
                dp[i] = dp[i + 1]
            }
        }
        return dp[0]
    }
}
