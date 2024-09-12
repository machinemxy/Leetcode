// https://leetcode.com/problems/count-the-number-of-consistent-strings/description/

class Solution {
    fun countConsistentStrings(allowed: String, words: Array<String>): Int {
        val set = mutableSetOf<Char>()
        for (c in allowed) {
            set.add(c)
        }
        var result = 0
        for (word in words) {
            if (isAllowed(word, set)) {
                result++
            }
        }
        return result
    }

    private fun isAllowed(word: String, set: Set<Char>): Boolean {
        for (c in word) {
            if (!set.contains(c)) {
                return false
            }
        }
        return true
    }
}
