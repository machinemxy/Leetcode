// https://leetcode.com/problems/minimum-deletions-to-make-string-balanced/description/

import kotlin.math.min

class Solution {
    fun minimumDeletions(s: String): Int {
        var bBeforeDivider = 0
        var aAfterDivider = 0
        for (c in s) {
            if (c == 'a') {
                aAfterDivider++
            }
        }
        var minDelections = aAfterDivider
        for (c in s) {
            if (c == 'a') {
                aAfterDivider--
            } else {
                bBeforeDivider++
            }
            val newDelections = aAfterDivider + bBeforeDivider
            minDelections = min(minDelections, newDelections)
        }
        return minDelections
    }
}
