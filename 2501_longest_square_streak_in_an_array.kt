// https://leetcode.com/problems/longest-square-streak-in-an-array/description/

import kotlin.math.max

class Solution {
    fun longestSquareStreak(nums: IntArray): Int {
        val sortedNums = nums.toSet().sorted()
        val usedMap = mutableMapOf<Int, Boolean>()
        var result = 1
        for (num in sortedNums) {
            usedMap[num] = false
        }
        for (num in sortedNums) {
            if (num > 1000) {
                break
            }
            if (usedMap.getValue(num)) {
                continue
            }
            var testNum = num * num
            var streak = 1
            while (true) {
                if (usedMap.keys.contains(testNum)) {
                    streak++
                    usedMap[testNum] = true
                    if (testNum > 1000) {
                        break
                    } else {
                        testNum *= testNum
                    }
                } else {
                    break
                }
            }
            result = max(result, streak)
        }
        return if (result == 1) {
            -1
        } else {
            result
        }
    }
}
