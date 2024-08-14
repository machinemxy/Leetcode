// https://leetcode.com/problems/find-k-th-smallest-pair-distance/description/

import kotlin.math.abs
import kotlin.math.max
import kotlin.math.min

class Solution {
    fun smallestDistancePair(nums: IntArray, k: Int): Int {
        var minNum = Int.MAX_VALUE
        var maxNum = Int.MIN_VALUE
        for (num in nums) {
            minNum = min(minNum, num)
            maxNum = max(maxNum, num)
        }
        val arraySize = maxNum - minNum + 1
        val disArray = IntArray(arraySize)
        for (i in 0 until nums.size - 1) {
            for (j in i + 1 until nums.size) {
                val distance = abs(nums[i] - nums[j])
                disArray[distance]++
            }
        }
        var kk = k
        for (i in disArray.indices) {
            kk -= disArray[i]
            if (kk <= 0) {
                return i
            }
        }
        return -1
    }
}
