// https://leetcode.com/problems/sum-of-digits-of-string-after-convert/description/

class Solution {
    fun getLucky(s: String, k: Int): Int {
        var sb = StringBuilder()
        for (c in s) {
            sb.append(c - 'a' + 1)
        }
        var newS = sb.toString()
        var restK = k
        while (true) {
            restK--
            var sum = 0
            for (c in newS) {
                sum += c.toString().toInt()
            }
            if (sum < 10 || restK == 0) {
                return sum
            } else {
                newS = sum.toString()
            }
        }
    }
}
