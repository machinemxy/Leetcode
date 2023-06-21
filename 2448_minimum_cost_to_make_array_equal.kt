// https://leetcode.com/problems/minimum-cost-to-make-array-equal/description/

import kotlin.math.min

class Solution {
    fun minCost(nums: IntArray, cost: IntArray): Long {
        val n = nums.size
        if (n == 1) { return 0L }
        val numsAndCosts = nums.indices.map { NumAndCost(nums[it], cost[it]) }
            .sortedBy { it.num }
        val aggregatedCosts = LongArray(n)
        aggregatedCosts[0] = numsAndCosts[0].cost.toLong()
        for (i in 1 until n) {
            aggregatedCosts[i] = aggregatedCosts[i - 1] + numsAndCosts[i].cost
        }
        var totalCost = 0L
        val firstNum = numsAndCosts[0].num
        for (i in 1 until n) {
            totalCost += (numsAndCosts[i].num - firstNum).toLong() * numsAndCosts[i].cost
        }
        var result = totalCost
        for (i in 1 until n) {
            val gap = numsAndCosts[i].num - numsAndCosts[i - 1].num
            totalCost = totalCost + aggregatedCosts[i - 1] * gap - (aggregatedCosts[n - 1] - aggregatedCosts[i - 1]) * gap
            result = min(result, totalCost)
        }
        return result
    }
}

data class NumAndCost(
    val num: Int,
    val cost: Int
)
