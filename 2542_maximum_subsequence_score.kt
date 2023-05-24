// https://leetcode.com/problems/maximum-subsequence-score/description/

import java.util.PriorityQueue
import kotlin.math.max

class Solution {
    fun maxScore(nums1: IntArray, nums2: IntArray, k: Int): Long {
        val n = nums1.size
        val nums12 = (0 until n).map { Num12(nums1[it], nums2[it]) }.sortedByDescending { it.num2 }
        var sum = 0L
        var result = 0L
        var queue = PriorityQueue<Int>()
        nums12.forEachIndexed { i, num12 ->
            queue.add(num12.num1)
            sum += num12.num1
            if (queue.size > k) {
                val last = queue.poll()
                sum -= last
            }
            if (i >= k - 1) {
                result = max(result, sum * num12.num2)
            }
        }
        return result
    }
}

data class Num12(
    val num1: Int,
    val num2: Int
)
