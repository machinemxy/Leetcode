// https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-transaction-fee/description/

import kotlin.math.max

class Solution {
    fun maxProfit(prices: IntArray, fee: Int): Int {
        val n = prices.size
        if (n == 1) { return 0 }
        var free = 0
        var hold = -prices[0]
        for (i in 1 until n) {
            val tmpHold = hold
            hold = max(hold, free - prices[i])
            free = max(free, tmpHold + prices[i] - fee)
        }
        return free
    }
}
