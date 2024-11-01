// https://leetcode.com/problems/delete-characters-to-make-fancy-string/description/

class Solution {
    fun makeFancyString(s: String): String {
        val sb = StringBuilder()
        var currentChar = 'a'
        var currentStreak = 0
        for (c in s) {
            if (c != currentChar) {
                sb.append(c)
                currentChar = c
                currentStreak = 1
            } else if (currentStreak < 2) {
                sb.append(c)
                currentStreak++
            }
        }
        return sb.toString()
    }
}
