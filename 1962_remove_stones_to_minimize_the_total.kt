// https://leetcode.com/problems/remove-stones-to-minimize-the-total/description/

class Solution {
    fun minStoneSum(piles: IntArray, k: Int): Int {
        val queue = PriorityQueue<Int> { a, b -> b - a}
        var result = 0
        for (pile in piles) {
            queue.add(pile)
            result += pile
        }
        for (i in 1..k) {
            val pile = queue.poll()
            val half = pile / 2
            val rest = pile - half
            queue.add(rest)
            result -= half
        }
        return result
    }
}
