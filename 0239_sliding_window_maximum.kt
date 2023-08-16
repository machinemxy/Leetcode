// https://leetcode.com/problems/sliding-window-maximum/description/

class Solution {
    fun maxSlidingWindow(nums: IntArray, k: Int): IntArray {
        val n = nums.size
        val result = IntArray(n - k + 1)
        val deque = ArrayDeque<Int>()
        for (i in 0 until k) {
            while (deque.isNotEmpty()) {
                val lastId = deque.last()
                if (nums[lastId] > nums[i]) {
                    break
                } else {
                    deque.removeLast()
                }
            }
            deque.add(i)
        }
        result[0] = nums[deque.first()]
        for (i in 1 .. n - k) {
            if (deque.first() == i - 1) {
                deque.removeFirst()
            }
            while (deque.isNotEmpty()) {
                val lastId = deque.last()
                if (nums[lastId] > nums[i + k - 1]) {
                    break
                } else {
                    deque.removeLast()
                }
            }
            deque.add(i + k - 1)
            result[i] = nums[deque.first()]
        }
        return result
    }
}
