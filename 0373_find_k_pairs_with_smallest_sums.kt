// https://leetcode.com/problems/find-k-pairs-with-smallest-sums/description/

import java.util.PriorityQueue

class Solution {
    fun kSmallestPairs(nums1: IntArray, nums2: IntArray, k: Int): List<List<Int>> {
        val size1 = nums1.size
        val size2 = nums2.size
        val visited = mutableSetOf<Pair<Int, Int>>(Pair(0, 0))
        val queue = PriorityQueue<Combination>() { p1, p2 ->
            p1.value1 + p1.value2 - (p2.value1 + p2.value2)
        }
        queue.add(Combination(0, 0, nums1[0], nums2[0]))
        val result = mutableListOf<List<Int>>()
        for (i in 1..k) {
            if (queue.isEmpty()) { break }
            val pair = queue.poll()
            result.add(listOf(pair.value1, pair.value2))
            if (pair.index1 + 1 < size1) {
                if (!visited.contains(Pair(pair.index1 + 1, pair.index2))) {
                    visited.add(Pair(pair.index1 + 1, pair.index2))
                    queue.add(Combination(pair.index1 + 1, pair.index2, nums1[pair.index1 + 1], nums2[pair.index2]))
                }
            }
            if (pair.index2 + 1 < size2) {
                if (!visited.contains(Pair(pair.index1, pair.index2 + 1))) {
                    visited.add(Pair(pair.index1, pair.index2 + 1))
                    queue.add(Combination(pair.index1, pair.index2 + 1, nums1[pair.index1], nums2[pair.index2 + 1]))
                }
            }
        }
        return result.toList()
    }
}

data class Combination(
    val index1: Int,
    val index2: Int,
    val value1: Int,
    val value2: Int
)
