// https://leetcode.com/problems/minimum-number-of-changes-to-make-binary-string-beautiful/description/

class Solution {
    fun minChanges(s: String): Int {
        var result = 0
        for (i in 0..<s.length step 2) {
            if (s[i] != s[i + 1]) {
                result++
            }
        }
        return result
    }
}
