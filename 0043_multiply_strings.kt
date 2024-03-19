// https://leetcode.com/problems/multiply-strings/description/

import java.math.BigInteger

class Solution {
    fun multiply(num1: String, num2: String): String {
        return BigInteger(num1).multiply(BigInteger(num2)).toString()
    }
}
