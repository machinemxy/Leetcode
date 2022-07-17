// https://leetcode.com/problems/k-inverse-pairs-array/

class Solution {
    private static let modulo = 1000000007

    func kInversePairs(_ n: Int, _ k: Int) -> Int {
        let dpRow = Array(repeating: 0, count: k + 1)
        var dp = Array(repeating: dpRow, count: n + 1)
        dp[1][0] = 1
        if n == 1 {
            return dp[n][k]
        }

        for i in 2...n {
            for j in 0...min(k, maxK(n: i)) {
                var value = 0
                for l in 0...(i - 1) {
                    if j - l < 0 { break }
                    value += dp[i - 1][j - l]
                }
                dp[i][j] = value % Solution.modulo
            }
        }

        return dp[n][k]
    }

    private func maxK(n: Int) -> Int {
        var result = 0

        for i in stride(from: 1, through: n - 1, by: 1) {
            result += i
        }

        return result
    }
}
