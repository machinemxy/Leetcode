// https://leetcode.com/problems/length-of-last-word/description/

class Solution {
    fun lengthOfLastWord(s: String): Int {
        val newS = s.trimEnd()
        val n = newS.length
        for (i in n - 1 downTo 0) {
            if (newS[i] == ' ') {
                return n - i - 1
            }
        }
        return n
    }
}
