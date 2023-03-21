// https://leetcode.com/problems/number-of-zero-filled-subarrays/description/

class Solution {
    fun zeroFilledSubarray(nums: IntArray): Long {
        var result = 0L
        var zeroCount = 0L
        for (num in nums) {
            if (num == 0) {
                zeroCount++
            } else if (zeroCount != 0L) {
                result += ((1L + zeroCount) * zeroCount / 2L)
                zeroCount = 0L
            }
        }
        if (zeroCount != 0L) {
            result += ((1L + zeroCount) * zeroCount / 2L)
        }
        return result
    }
}
