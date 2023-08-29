// https://leetcode.com/problems/minimum-penalty-for-a-shop/description/

class Solution {
    fun bestClosingTime(customers: String): Int {
        var beforeN = 0
        var afterY = 0
        for (customer in customers) {
            if (customer == 'Y') {
                afterY++
            }
        }
        var minPenalty = afterY
        var closeTime = 0
        customers.forEachIndexed { i, customer ->
            if (customer == 'Y') {
                afterY--
            } else {
                beforeN++
            }
            var penalty = beforeN + afterY
            if (penalty < minPenalty) {
                minPenalty = penalty
                closeTime = i + 1
            }
        }
        return closeTime
    }
}
