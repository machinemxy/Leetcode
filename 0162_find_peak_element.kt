// https://leetcode.com/problems/find-peak-element/description/

class Solution {
    fun findPeakElement(nums: IntArray): Int {
        var n = nums.size
        if (n == 1) {
            return 0
        }
        var l = 0
        var r = n - 1
        while (l <= r) {
            val mid = (l + r) / 2
            val trend = getTrend(mid, nums)
            when (trend) {
                Trend.PEAK -> return mid
                Trend.INCREASING -> l = mid + 1
                Trend.DECREASING -> r = mid - 1
            }
        }
        return l
    }

    private fun getTrend(i: Int, nums: IntArray): Trend {
        val n = nums.size
        val num = nums[i]
        if (i == 0) {
            return if (nums[i + 1] < num) {
                Trend.PEAK
            } else {
                Trend.INCREASING
            }
        } else if (i == n - 1) {
            return if (nums[i - 1] < num) {
                Trend.PEAK
            } else {
                Trend.DECREASING
            }
        } else if (num > nums[i - 1]) {
            return if (num > nums[i + 1]) {
                Trend.PEAK
            } else {
                Trend.INCREASING
            }
        } else {
            return Trend.DECREASING
        }
    }
}

enum class Trend {
    INCREASING,
    PEAK,
    DECREASING
}
