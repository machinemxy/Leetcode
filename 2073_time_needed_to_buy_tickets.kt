// https://leetcode.com/problems/time-needed-to-buy-tickets/description/

class Solution {
    fun timeRequiredToBuy(tickets: IntArray, k: Int): Int {
        val deque = ArrayDeque<Int>()
        for (i in tickets.indices) {
            if (i == k) {
                deque.add(tickets[i] + 1000)
            } else {
                deque.add(tickets[i])
            }
        }
        var result = 0
        while (true) {
            var i = deque.removeFirst()
            i--
            result++
            if (i == 1000) {
                return result
            } else if (i != 0) {
                deque.add(i)
            }
        }
    }
}
