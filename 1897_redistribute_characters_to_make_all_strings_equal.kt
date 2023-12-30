// https://leetcode.com/problems/redistribute-characters-to-make-all-strings-equal/description/

class Solution {
    fun makeEqual(words: Array<String>): Boolean {
        val map = mutableMapOf<Char, Int>()
        for (word in words) {
            for (c in word) {
                map[c] = map.getOrDefault(c, 0) + 1
            }
        }
        val n = words.size
        for (value in map.values) {
            if (value % n > 0) {
                return false
            }
        }
        return true
    }
}
