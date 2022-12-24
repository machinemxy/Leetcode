// https://leetcode.com/problems/domino-and-tromino-tiling/description/

class Solution {
    func numTilings(_ n: Int) -> Int {
        guard n > 2 else {
            if n == 1 {
                return 1
            } else {
                return 2
            }
        }
        var dp = Array(repeating: 0, count: n + 1)
        dp[0] = 1
        dp[1] = 1
        dp[2] = 2
        for i in 3...n {
            dp[i] = (dp[i - 1] * 2 + dp[i - 3]) % 1000000007
        }
        return dp[n] 
    }
}
