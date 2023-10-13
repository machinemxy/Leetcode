// https://leetcode.com/problems/min-cost-climbing-stairs/

import kotlin.math.min

class Solution {
    fun minCostClimbingStairs(cost: IntArray): Int {
        val n = cost.size
        if (n == 2) {
            return min(cost[0], cost[1])
        }
        
        for (i in 2 until n) {
            val currentCost = cost[i]
            cost[i] = currentCost + min(cost[i - 1], cost[i - 2])
        }
        return min(cost[n - 1], cost[n - 2])
    }
}
