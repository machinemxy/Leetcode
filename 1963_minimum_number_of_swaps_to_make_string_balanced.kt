// https://leetcode.com/problems/minimum-number-of-swaps-to-make-the-string-balanced/description/

class Solution {
    fun minSwaps(s: String): Int {
        val a = s.toCharArray()
        val n = a.size
        var leftBracketSearchStartId = n - 1
        var lefts = 0
        var result = 0
        for (i in a.indices) {
            val c = a[i]
            if (c == '[') {
                lefts++
            } else if (lefts > 0) {
                lefts--
            } else {
                while (a[leftBracketSearchStartId] != '[') {
                    leftBracketSearchStartId--
                }
                a[leftBracketSearchStartId] = ']'
                result++
                lefts++
                leftBracketSearchStartId--
            }
        }
        return result
    }
}
