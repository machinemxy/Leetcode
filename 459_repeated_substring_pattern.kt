// https://leetcode.com/problems/repeated-substring-pattern/description/

class Solution {
    fun repeatedSubstringPattern(s: String): Boolean {
        val n = s.length
        if (n == 1) {
            return false
        }
        outer@for (i in 2 .. n) {
            if (n % i != 0) {
                continue
            }
            val subN = n / i
            val firstSubStr = s.substring(0, subN)
            for (j in 1 until i) {
                val subStr = s.substring(j * subN, (j + 1) * subN)
                if (firstSubStr == subStr) {
                    continue
                } else {
                    continue@outer
                }
            }
            return true
        }
        return false
    }
}
