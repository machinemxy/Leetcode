// https://leetcode.com/problems/find-first-palindromic-string-in-the-array/description/

class Solution {
    fun firstPalindrome(words: Array<String>): String {
        for (word in words) {
            if (word == word.reversed()) {
                return word
            }
        }
        return ""
    }
}
