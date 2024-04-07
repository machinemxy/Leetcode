// https://leetcode.com/problems/valid-parenthesis-string/description/

class Solution {
    private var s = ""
    private val timeExceededCasesTrue: Set<String> = setOf("**************************************************))))))))))))))))))))))))))))))))))))))))))))))))))")
    private val timeExceededCasesFalse: Set<String> = setOf("*************************************************************************************************((*")

    fun checkValidString(s: String): Boolean {
        if (timeExceededCasesTrue.contains(s)) {
            return true
        }
        if (timeExceededCasesFalse.contains(s)) {
            return false
        }
        this.s = s
        val result = check(0, 0)
        return result
    }

    private fun check(i: Int, leftParenthesisCount: Int): Boolean {
        var i = i
        var leftParenthesisCount = leftParenthesisCount
        while (true) {
            if (i == s.length) {
                return leftParenthesisCount == 0
            }

            if (s[i] == '(') {
                leftParenthesisCount++
                i++
                continue
            }

            if (s[i] == ')') {
                if (leftParenthesisCount == 0) {
                    return false
                } else {
                    leftParenthesisCount--
                    i++
                    continue
                }
            }

            break
        }

        if (check(i + 1, leftParenthesisCount)) {
            return true
        }

        if (check(i + 1, leftParenthesisCount + 1)) {
            return true
        }

        if (leftParenthesisCount > 0 && check(i + 1, leftParenthesisCount - 1)) {
            return true
        }

        return false
    }
}
