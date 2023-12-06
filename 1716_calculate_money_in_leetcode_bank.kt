// https://leetcode.com/problems/calculate-money-in-leetcode-bank/description/

class Solution {
    fun totalMoney(n: Int): Int {
        var prevMonday = 0
        var prevDay = 0
        var result = 0
        for (i in 1 .. n) {
            if (i % 7 == 1) {
                val today = prevMonday + 1
                prevMonday = today
                prevDay = today
                result += today
            } else {
                val today = prevDay + 1
                prevDay = today
                result += today
            }
        }
        return result
    }
}
