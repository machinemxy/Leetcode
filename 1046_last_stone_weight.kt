// https://leetcode.com/problems/last-stone-weight/description/

import java.util.PriorityQueue

class Solution {
    fun lastStoneWeight(stones: IntArray): Int {
        val queue = PriorityQueue<Int>(compareByDescending { it })
        for (stone in stones) {
            queue.add(stone)
        }
        while (queue.isNotEmpty()) {
            val stone1 = queue.poll()
            if (queue.isEmpty()) {
                return stone1
            } else {
                val stone2 = queue.poll()
                val rest = stone1 - stone2
                if (rest > 0) {
                    queue.add(rest)
                }
            }
        }
        return 0
    }
}
