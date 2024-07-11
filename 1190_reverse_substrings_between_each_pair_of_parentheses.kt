// https://leetcode.com/problems/reverse-substrings-between-each-pair-of-parentheses/description/

class Solution {
    fun reverseParentheses(s: String): String {
        val a = s.toMutableList()
        val leftP = ArrayDeque<Int>()

        for (i in a.indices) {
            if (a[i] == '(') {
                leftP.add(i)
            } else if (a[i] == ')') {
                var l = leftP.removeLast() + 1
                var r = i - 1
                while (l < r) {
                    val t = a[l]
                    a[l] = a[r]
                    a[r] = t
                    l++
                    r--
                }
            }
        }
        var i = 0
        while (i < a.size) {
            if (a[i] == '(' || a[i] == ')') {
                a.removeAt(i)
            } else {
                i++
            }
        }
        return a.joinToString(separator = "")
    }
}
