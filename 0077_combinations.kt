// https://leetcode.com/problems/combinations/description/

class Solution {
    fun combine(n: Int, k: Int): List<List<Int>> {
        return calculate(n, k).map { it.toList() }
    }

    private fun calculate(n: Int, k: Int): ArrayDeque<ArrayDeque<Int>> {
        if (k == 1) {
            val bigDeque = ArrayDeque<ArrayDeque<Int>>()
            for (i in 1..n) {
                val smallDeque = ArrayDeque<Int>()
                smallDeque.add(i)
                bigDeque.add(smallDeque)
            }
            return bigDeque
        }
        val bigDeque = calculate(n - 1, k - 1)
        val size = bigDeque.size
        for (i in 1..size) {
            val smallDeque = bigDeque.removeFirst()
            for (j in smallDeque.last() + 1 .. n) {
                val clonedDeque = ArrayDeque<Int>()
                clonedDeque.addAll(smallDeque)
                clonedDeque.add(j)
                bigDeque.add(clonedDeque)
            }
        }
        return bigDeque
    }
}
