// https://leetcode.com/problems/buy-two-chocolates/description/

class Solution {
    fun buyChoco(prices: IntArray, money: Int): Int {
        prices.sort()
        val minExpense = prices[0] + prices[1]
        if (money >= minExpense) {
            return money - minExpense
        } else {
            return money
        }
    }
}
