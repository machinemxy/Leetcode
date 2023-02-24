// https://leetcode.com/problems/minimize-deviation-in-array/description/

import kotlin.math.min

class Solution {
    fun minimumDeviation(nums: IntArray): Int {
        var numSet: MutableSet<Int> = mutableSetOf()
        for (num in nums) {
            if (num % 2 == 0) {
                numSet.add(num)
            } else {
                numSet.add(num * 2)
            }
        }
        var minNum = Int.MAX_VALUE
        var queue = PriorityQueue<Int>(compareByDescending { it })
        for (num in numSet) {
            minNum = min(minNum, num)
            queue.add(num)
        }
        var result = Int.MAX_VALUE
        while (true) {
            val maxNum = queue.poll()
            result = min(result, maxNum - minNum)
            if (maxNum % 2 != 0) {
                break
            }
            val halfMaxNum = maxNum / 2
            if (halfMaxNum < minNum) {
                queue.add(halfMaxNum)
                minNum = halfMaxNum
            } else {
                queue.add(halfMaxNum)
            }
        }
        return result
    }
}
