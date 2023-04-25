// https://leetcode.com/problems/smallest-number-in-infinite-set/description/

import java.util.PriorityQueue

class SmallestInfiniteSet() {
    private var line = 1
    private val queue = PriorityQueue<Int>(compareBy { it })
    private val set = mutableSetOf<Int>()

    fun popSmallest(): Int {
        if (queue.isNotEmpty()) {
            val num = queue.poll()
            set.remove(num)
            return num
        } else {
            return line++
        }
    }

    fun addBack(num: Int) {
        if (num < line && !set.contains(num)) {
            queue.add(num)
            set.add(num)
        }
    }
}
