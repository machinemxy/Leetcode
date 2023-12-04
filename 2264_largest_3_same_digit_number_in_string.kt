// https://leetcode.com/problems/largest-3-same-digit-number-in-string/description/

import kotlin.math.max

class Solution {
    fun largestGoodInteger(num: String): String {
        var result = -1
        var currentChar = '-'
        var currentCount = 0
        for (c in num) {
            if (c == currentChar) {
                currentCount++
                if (currentCount == 3) {
                    val num = c.toString().toInt()
                    result = max(result, num)
                }
            } else {
                currentChar = c
                currentCount = 1
            }
        }
        if (result == -1) {
            return ""
        } else {
            return "$result$result$result"
        }
    }
}
