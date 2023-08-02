// https://leetcode.com/problems/permutations/description/

class Solution {
    fun permute(nums: IntArray): List<List<Int>> {
        val deque = ArrayDeque<List<Int>>()
        deque.add(listOf(nums[0]))
        for (i in 1 until nums.size) {
            val size = deque.size
            for (j in 1 .. size) {
                val list = deque.removeFirst()
                for (k in 0 .. list.size) {
                    val mutableList = list.toMutableList()
                    mutableList.add(k, nums[i])
                    deque.add(mutableList.toList())
                }
            }
        }
        return deque.toList()
    }
}
