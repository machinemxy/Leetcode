// https://leetcode.com/problems/maximum-nesting-depth-of-the-parentheses/description/

import kotlin.math.max

class Solution {
    fun maxDepth(s: String): Int {
        var count = 0
        var result = 0
        for (c in s) {
            if (c == '(') {
                count++
                result = max(result, count)
            } else if (c == ')') {
                count--
            }
        }
        return result
    }
}
