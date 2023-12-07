// https://leetcode.com/problems/largest-odd-number-in-string/

class Solution {
    fun largestOddNumber(num: String): String {
        val n = num.length
        for (i in n - 1 downTo 0) {
            val checkNum = num[i].toString().toInt()
            if (checkNum % 2 == 1) {
                return num.substring(0, i + 1)
            }
        }
        return ""
    }
}
