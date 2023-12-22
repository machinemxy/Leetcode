// https://leetcode.com/problems/maximum-score-after-splitting-a-string/description/

import kotlin.math.max

class Solution {
    fun maxScore(s: String): Int {
        var leftZeros = if (s[0] == '0') {
            1
        } else {
            0
        }
        var rightOnes = 0
        for (i in 1 until s.length) {
            if (s[i] == '1') {
                rightOnes++
            }
        }
        var result = leftZeros + rightOnes
        for (i in 1 until s.length - 1) {
            if (s[i] == '0') {
                leftZeros++
                result = max(result, leftZeros + rightOnes)
            } else {
                rightOnes--
            }
        }
        return result
    }
}
