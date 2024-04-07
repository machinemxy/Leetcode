// https://leetcode.com/problems/valid-parenthesis-string/description/

class Solution {
    fun checkValidString(s: String): Boolean {
        var minLeftParenthesisCount = 0
        var maxLeftParenthesisCount = 0
        for (c in s) {
            if (c == '(') {
                minLeftParenthesisCount++
                maxLeftParenthesisCount++
            } else if (c == ')') {
                if (maxLeftParenthesisCount == 0) {
                    return false
                } else {
                    maxLeftParenthesisCount--
                }
                if (minLeftParenthesisCount > 0) {
                    minLeftParenthesisCount--
                }
            } else {
                if (minLeftParenthesisCount > 0) {
                    minLeftParenthesisCount--
                }
                maxLeftParenthesisCount++
            }
        }
        return minLeftParenthesisCount == 0
    }
}
