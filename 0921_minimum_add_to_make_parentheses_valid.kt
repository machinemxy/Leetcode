// https://leetcode.com/problems/minimum-add-to-make-parentheses-valid/description/

class Solution {
    fun minAddToMakeValid(s: String): Int {
        var result = 0
        var lefts = 0
        for (c in s) {
            if (c == '(') {
                lefts++
            } else if (lefts == 0) {
                result++
            } else {
                lefts--
            }
        }
        result += lefts
        return result
    }
}
