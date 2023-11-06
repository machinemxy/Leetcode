// https://leetcode.com/problems/seat-reservation-manager/description/

import java.util.PriorityQueue

class SeatManager(n: Int) {
    private val queue: PriorityQueue<Int>

    init {
        queue = PriorityQueue()
        for (i in 1 .. n) {
            queue.add(i)
        }
    }

    fun reserve(): Int {
        return queue.poll()
    }

    fun unreserve(seatNumber: Int) {
        queue.add(seatNumber)
    }
}
