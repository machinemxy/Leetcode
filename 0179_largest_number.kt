// https://leetcode.com/problems/largest-number/description/

import java.util.PriorityQueue

class Solution {
    fun largestNumber(nums: IntArray): String {
        val queue = PriorityQueue<String> { s1, s2 ->
            (s2 + s1).compareTo(s1 + s2)
        }
        for (num in nums) {
            queue.add(num.toString())
        }
        val result = StringBuilder()
        while (queue.isNotEmpty()) {
            result.append(queue.poll())
        }
        return if (result.first() == '0') {
            "0"
        } else {
            result.toString()
        }
    }
}
