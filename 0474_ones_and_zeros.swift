// https://leetcode.com/problems/ones-and-zeroes/

class Solution {
    func findMaxForm(_ strs: [String], _ m: Int, _ n: Int) -> Int {
        let row = Array(repeating: 0, count: n + 1)
        var dp = Array(repeating: row, count: m + 1)

        for str in strs {
            var zeros = 0
            var ones = 0
            for char in str {
                if char == "1" {
                    ones += 1
                } else {
                    zeros += 1
                }
            }

            for i in stride(from: m, through: zeros, by: -1) {
                for j in stride(from: n, through: ones, by: -1) {
                    dp[i][j] = max(dp[i][j], dp[i - zeros][j - ones] + 1)
                }
            }
        }

        return dp[m][n]
    }
}
