// https://leetcode.com/problems/count-the-number-of-fair-pairs/description/

class Solution {
    fun countFairPairs(nums: IntArray, lower: Int, upper: Int): Long {
        if (nums.size == 1) { return 0 }
        var result = 0L
        nums.sort()
        for (i in 0..<nums.size - 1) {
            val lower1 = lower - nums[i]
            var upper1 = upper - nums[i]
            var l = i + 1
            var r = nums.size - 1
            while (l <= r) {
                val mid = (l + r) / 2
                val midVal = nums[mid]
                if (midVal >= lower1) {
                    r = mid - 1
                } else {
                    l = mid + 1
                }
            }
            if (l >= nums.size) {
                continue
            }
            val lBound = l
            l = i + 1
            r = nums.size - 1
            while (l <= r) {
                val mid = (l + r) / 2
                val midVal = nums[mid]
                if (midVal <= upper1) {
                    l = mid + 1
                } else {
                    r = mid - 1
                }
            }
            if (r < i) {
                continue
            }
            val rBound = r
            if (lBound > rBound) {
                continue
            }
            result += (rBound - lBound + 1)
        }
        return result
    }
}
