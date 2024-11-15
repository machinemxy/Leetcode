// https://leetcode.com/problems/shortest-subarray-to-be-removed-to-make-array-sorted/description/

import kotlin.math.min

class Solution {
    fun findLengthOfShortestSubarray(arr: IntArray): Int {
        var right = arr.size - 1
        while (right > 0 && arr[right - 1] <= arr[right]) {
            right--
        }
        var result = right
        var left = 0
        while (left < right && (left == 0 || arr[left - 1] <= arr[left])) {
            while (right < arr.size && arr[left] > arr[right]) {
                right++
            }
            result = min(result, right - left - 1)
            left++
        }
        return result
    }
}
