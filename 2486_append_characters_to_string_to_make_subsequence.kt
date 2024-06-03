// https://leetcode.com/problems/append-characters-to-string-to-make-subsequence/description/

class Solution {
    fun appendCharacters(s: String, t: String): Int {
        var i = 0
        for (c in s) {
            if (t[i] == c) {
                i++
                if (i == t.length) {
                    return 0
                }
            }
        }
        return t.length - i
    }
}
