// https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string/description/

class Solution {
    fun strStr(haystack: String, needle: String): Int {
        val needleSize = needle.count()
        val checkers = ArrayList<Int>()
        for (i in haystack.indices) {
            val currentChar = haystack[i]
            checkers.add(0)
            for (j in checkers.indices.reversed()) {
                val checker = checkers[j]
                if (currentChar == needle[checker]) {
                    if (checker == needleSize - 1) {
                        return i - needleSize + 1
                    }
                    checkers[j]++
                } else {
                    checkers.removeAt(j)
                }
            }
        }
        return -1
    }
}
