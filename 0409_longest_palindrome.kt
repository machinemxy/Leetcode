// https://leetcode.com/problems/longest-palindrome/description/

class Solution {
    fun longestPalindrome(s: String): Int {
        var set = mutableSetOf<Char>()
        var result = 0
        for (c in s) {
            if (set.contains(c)) {
                set.remove(c)
                result += 2
            } else {
                set.add(c)
            }
        }
        if (set.isEmpty()) {
            return result
        } else {
            return result + 1
        }
    }
}
