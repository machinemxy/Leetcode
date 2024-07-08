// https://leetcode.com/problems/find-the-winner-of-the-circular-game/description/

class Solution {
    fun findTheWinner(n: Int, k: Int): Int {
        val list = mutableListOf<Int>()
        for (i in 1 .. n) {
            list.add(i)
        }
        var i = 0
        while (list.size > 1) {
            val kk = (k - 1) % list.size
            i += kk
            if (i >= list.size) {
                i -= list.size
            }
            list.removeAt(i)
        }
        return list[0]
    }
}
