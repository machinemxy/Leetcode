// https://leetcode.com/problems/score-of-a-string/description/

import kotlin.math.abs

class Solution {
    fun scoreOfString(s: String): Int {
        var result = 0
        for (i in 1 until s.length) {
            result += abs(s[i] - s[i - 1])
        }
        return result
    }
}
