// https://leetcode.com/problems/average-waiting-time/description/

class Solution {
    fun averageWaitingTime(customers: Array<IntArray>): Double {
        var waitingTime = 0L
        var currentTime = 0
        for (customer in customers) {
            if (customer[0] >= currentTime) {
                currentTime = customer[0] + customer[1]
                waitingTime += customer[1]
            } else {
                currentTime += customer[1]
                waitingTime += (currentTime - customer[0])
            }
        }
        return waitingTime.toDouble() / customers.size.toDouble()
    }
}
