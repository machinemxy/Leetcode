// https://leetcode.com/problems/non-overlapping-intervals/description/

import kotlin.math.min

class Solution {
    fun eraseOverlapIntervals(intervals: Array<IntArray>): Int {
        intervals.sortBy { it[0] }
        var removed = 0
        var lastEnd = Int.MIN_VALUE
        for (interval in intervals) {
            if (interval[0] >= lastEnd) {
                lastEnd = interval[1]
            } else {
                lastEnd = min(lastEnd, interval[1])
                removed += 1
            }
        }
        return removed
    }
}
