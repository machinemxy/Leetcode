// https://leetcode.com/problems/paint-house-iii/

class Solution {
    func minCost(_ houses: [Int], _ cost: [[Int]], _ m: Int, _ n: Int, _ target: Int) -> Int {
        let targets = Array(repeating: Int.max, count: target)
        let ns = Array(repeating: targets, count: n)
        var dp = Array(repeating: ns, count: m)

        for i in 0..<m {
            if houses[i] == 0 {
                // can paint
                for j in 0..<n {
                    if i == 0 {
                        dp[i][j][0] = cost[i][j]
                    } else {
                        for k in 0..<target {
                            if k == 0 {
                                let prevCost = dp[i - 1][j][k]
                                if prevCost != Int.max {
                                    dp[i][j][k] = prevCost + cost[i][j]
                                }
                            } else {
                                var minCost = Int.max
                                for jj in 0..<n {
                                    if j == jj {
                                        minCost = min(minCost, dp[i - 1][jj][k])
                                    } else {
                                        minCost = min(minCost, dp[i - 1][jj][k - 1])
                                    }
                                }
                                if minCost != Int.max {
                                    dp[i][j][k] = minCost + cost[i][j]
                                }
                            }
                        }
                    }
                }
            } else {
                let j = houses[i] - 1
                // cannot paint
                if i == 0 {
                    dp[i][j][0] = 0
                } else {
                    for k in 0..<target {
                        if k == 0 {
                            dp[i][j][k] = dp[i - 1][j][k]
                        } else {
                            var minCost = Int.max
                            for jj in 0..<n {
                                if j == jj {
                                    minCost = min(minCost, dp[i - 1][jj][k])
                                } else {
                                    minCost = min(minCost, dp[i - 1][jj][k - 1])
                                }
                            }
                            if minCost != Int.max {
                                dp[i][j][k] = minCost
                            }
                        }
                    }
                }
            }
        }

        var minTotalCost = Int.max
        for j in 0..<n {
            minTotalCost = min(minTotalCost, dp[m - 1][j][target - 1])
        }
        if minTotalCost == Int.max {
            return -1
        } else {
            return minTotalCost
        }
    }
}
