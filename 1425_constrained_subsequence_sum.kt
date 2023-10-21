// https://leetcode.com/problems/constrained-subsequence-sum/

import kotlin.math.max

class Solution {
    fun constrainedSubsetSum(nums: IntArray, k: Int): Int {
        var result = Int.MIN_VALUE
        val n = nums.size
        val dp = IntArray(n)
        val heap = ArrayDeque<Int>()
        for (i in 0 until n) {
            if (heap.isNotEmpty()) {
                if (heap.first() < i - k) {
                    heap.removeFirst()
                }
            }
            var best = nums[i]
            if (heap.isNotEmpty()) {
                best = max(best, dp[heap.first()] + best)
            }
            result = max(result, best)
            dp[i] = best
            while (heap.isNotEmpty() && dp[heap.last()] < best) {
                heap.removeLast()
            }
            heap.add(i)
        }
        return result
    }
}
