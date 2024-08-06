// https://leetcode.com/problems/minimum-number-of-pushes-to-type-word-ii/description/

class Solution {
    fun minimumPushes(word: String): Int {
        val map = mutableMapOf<Char, Int>()
        for (c in word) {
            map[c] = map.getOrDefault(c, 0) + 1
        }
        val sortedMap = map.toList().sortedByDescending { it.second }
        var result = 0
        var clickTimes = 1
        var allocatedKeys = 0
        for (pair in sortedMap) {
            result += clickTimes * pair.second
            allocatedKeys++
            if (allocatedKeys == 8) {
                allocatedKeys = 0
                clickTimes++
            }
        }
        return result
    }
}
