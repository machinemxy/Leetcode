// https://leetcode.com/problems/get-equal-substrings-within-budget/description/

import kotlin.math.abs
import kotlin.math.max

class Solution {
    fun equalSubstring(s: String, t: String, maxCost: Int): Int {
        var l = 0
        var r = 0
        var currentCost = 0
        var result = 0
        while (true) {
            if (currentCost <= maxCost) {
                if (r >= s.length) {
                    break
                }
                currentCost += abs(t[r] - s[r])
                r++
                if (currentCost <= maxCost) {
                    result = max(result, r - l)
                }
            } else {
                currentCost -= abs(t[l] - s[l])
                l++
                if (currentCost <= maxCost) {
                    result = max(result, r - l)
                }
            }
        }
        return result
    }
}
