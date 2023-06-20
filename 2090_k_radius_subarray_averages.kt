// https://leetcode.com/problems/k-radius-subarray-averages/description/

class Solution {
    fun getAverages(nums: IntArray, k: Int): IntArray {
        val n = nums.size
        val range = 2 * k + 1
        val result = IntArray(n) { -1 }
        if (n < range) {
            return result
        }
        var tempSum = 0L
        for (i in 0 until range) {
            tempSum += nums[i]
        }
        result[k] = (tempSum / range).toInt()
        var j = k + 1
        while (j + k < n) {
            tempSum = tempSum - nums[j - k - 1] + nums[j + k]
            result[j] = (tempSum / range).toInt()
            j++
        }
        return result
    }
}
