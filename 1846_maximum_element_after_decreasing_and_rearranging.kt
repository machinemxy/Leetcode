// https://leetcode.com/problems/maximum-element-after-decreasing-and-rearranging/description/

import kotlin.math.min

class Solution {
    fun maximumElementAfterDecrementingAndRearranging(arr: IntArray): Int {
        arr.sort()
        arr[0] = 1
        val n = arr.size
        if (n == 1) {
            return 1
        }
        for (i in 1 until n) {
            arr[i] = min(arr[i], arr[i - 1] + 1)
        }
        return arr[n - 1]
    }
}
