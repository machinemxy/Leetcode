// https://leetcode.com/problems/number-of-senior-citizens/description/

class Solution {
    fun countSeniors(details: Array<String>): Int {
        var result = 0
        for (detail in details) {
            val age = detail.substring(11 .. 12).toInt()
            if (age > 60) {
                result++
            }
        }
        return result
    }
}
