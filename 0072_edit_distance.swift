// https://leetcode.com/problems/edit-distance/

class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let a1 = Array(word1)
        let a2 = Array(word2)
        guard !a1.isEmpty else { return a2.count }
        guard !a2.isEmpty else { return a1.count }
        let dpRow = Array(repeating: 0, count: a2.count + 1)
        var dp = Array(repeating: dpRow, count: a1.count + 1)
        for i in 1...a2.count {
            dp[0][i] = i
        }
        for i in 1...a1.count {
            dp[i][0] = i
        }
        for i in 1...a1.count {
            for j in 1...a2.count {
                if a1[i - 1] == a2[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1]
                } else {
                    dp[i][j] = min(dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1]) + 1
                }
            }
        }
        return dp[a1.count][a2.count]
    }
}
