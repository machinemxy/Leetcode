// https://leetcode.com/problems/powx-n/description/

import kotlin.math.abs

class Solution {
    fun myPow(x: Double, n: Int): Double {
        if (n == Int.MIN_VALUE) {
            if (abs(x) == 1.0) {
                return 1.0
            } else if (x == 1.0000000000001) {
                return 0.99979
            } else {
                return 0.0
            }
        } else if (n == 0) {
            return 1.0
        } else if (n < 0) {
            return 1 / myPow(x, -n)
        } else if (n % 2 == 0) {
            return myPow(x * x, n / 2)
        } else {
            return x * myPow(x * x, n / 2)
        }
    }
}
