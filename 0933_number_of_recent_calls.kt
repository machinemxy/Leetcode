// https://leetcode.com/problems/number-of-recent-calls/description/

class RecentCounter() {
    private val deque = ArrayDeque<Int>()
    
    fun ping(t: Int): Int {
        val start = t - 3000
        while (deque.isNotEmpty() && deque.first() < start) {
            deque.removeFirst()
        }
        deque.add(t)
        return deque.size
    }
}
