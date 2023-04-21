// https://leetcode.com/problems/profitable-schemes/description/

import java.lang.Integer.max

class Solution {
    fun profitableSchemes(n: Int, minProfit: Int, group: IntArray, profit: IntArray): Int {
        val dp = Array(group.size) { Array(n + 1) { IntArray(minProfit + 1) } }
        for (i in 0..n) {
            for (j in 0..minProfit) {
                // not do it
                var possibilities = if (j == 0) { 1 } else { 0 }
                // do it
                if (i >= group[0] && j <= profit[0]) {
                    possibilities++
                }
                dp[0][i][j] = possibilities
            }
        }

        if (group.size == 1) {
            return dp[0][n][minProfit]
        }

        for (i in 1 until group.size) {
            for (j in 0..n) {
                for (k in 0..minProfit) {
                    // not do it
                    var possibilities = dp[i - 1][j][k]
                    // do it
                    if (j >= group[i]) {
                        val restProfit = max(0, k - profit[i])
                        possibilities += dp[i - 1][j - group[i]][restProfit]
                        possibilities %= 1000000007
                    }
                    dp[i][j][k] = possibilities
                }
            }
        }
        
        return dp[group.size - 1][n][minProfit]
    }
}
