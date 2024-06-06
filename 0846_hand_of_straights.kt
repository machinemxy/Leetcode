// https://leetcode.com/problems/hand-of-straights/description/

import java.util.PriorityQueue

class Solution {
    fun isNStraightHand(hand: IntArray, groupSize: Int): Boolean {
        val map = mutableMapOf<Int, Int>()
        var queue = PriorityQueue<Int>()
        for (num in hand) {
            if (map.keys.contains(num)) {
                map[num] = map.getValue(num) + 1
            } else {
                queue.add(num)
                map[num] = 1
            }
        }
        while (map.isNotEmpty()) {
            val startNum = queue.peek()
            for (i in 0 until groupSize) {
                val num = startNum + i
                if (map.keys.contains(num)) {
                    if (map.getValue(num) == 1) {
                        map.remove(num)
                        queue.remove(num)
                    } else {
                        map[num] = map.getValue(num) - 1
                    }
                } else {
                    return false
                }
            }
        }
        return true
    }
}
