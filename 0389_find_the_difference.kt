// https://leetcode.com/problems/find-the-difference/description/

class Solution {
    fun findTheDifference(s: String, t: String): Char {
        val sortedS = s.toCharArray().sorted()
        val sortedT = t.toCharArray().sorted()
        for (i in sortedS.indices) {
            if (sortedS[i] != sortedT[i]) {
                return sortedT[i]
            }
        }
        return sortedT[sortedT.size - 1]
    }
}
