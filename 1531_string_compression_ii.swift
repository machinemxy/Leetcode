// https://leetcode.com/problems/string-compression-ii/

class Solution {
    func getLengthOfOptimalCompression(_ s: String, _ k: Int) -> Int {
        let arr = Array(s)
        let dpRow = Array(repeating: 100, count: k + 1)
        var dp = Array(repeating: dpRow, count: arr.count + 1)
        dp[0][0] = 0
        for i in 1...arr.count {
            for j in 0...k {
                var sameCount = 0
                var diffCount = 0
                for l in stride(from: i, through: 1, by: -1) {
                    if arr[l - 1] == arr[i - 1] {
                        sameCount += 1
                    } else {
                        diffCount += 1
                    }
                    guard diffCount <= j else { break }
                    dp[i][j] = min(dp[i][j], dp[l - 1][j - diffCount] + encodeCharCount(sameCount))
                }
                if j > 0 {
                    dp[i][j] = min(dp[i][j], dp[i - 1][j - 1])
                }
            }
        }
        return dp[arr.count][k]
    }
    
    func encodeCharCount(_ num: Int) -> Int {
        if num >= 100 {
            return 4
        } else if num >= 10 {
            return 3
        } else if num >= 2 {
            return 2
        } else {
            return 1
        }
    }
}
