// https://leetcode.com/problems/unique-length-3-palindromic-subsequences/description/

class Solution {
    fun countPalindromicSubsequence(s: String): Int {
        val n = s.length
        val leftMap = mutableMapOf<Char, Int>()
        leftMap[s[0]] = 1
        val rightMap = mutableMapOf<Char, Int>()
        for (i in 2 until n) {
            val c = s[i]
            rightMap[c] = rightMap.getOrDefault(c, 0) + 1
        }
        var midIndex = 1
        var result = mutableSetOf<String>()
        while (midIndex < n - 1) {
            val cMid = s[midIndex]
            for (c in leftMap.keys) {
                if (rightMap.keys.contains(c)) {
                    result.add("$c$cMid")
                }
            }
            leftMap[cMid] = leftMap.getOrDefault(cMid, 0) + 1
            midIndex++
            val newCMid = s[midIndex]
            val newCMidCount = rightMap.getOrDefault(newCMid, 1)
            if (newCMidCount == 1) {
                rightMap.remove(newCMid)
            } else {
                rightMap[newCMid] = newCMidCount - 1
            }
        }
        return result.size
    }
}
