// https://leetcode.com/problems/number-of-provinces/description/

class Solution {
    private var isConnected = arrayOf<IntArray>()
    private var isVisited = booleanArrayOf()
    private var n = 0

    fun findCircleNum(isConnected: Array<IntArray>): Int {
        this.isConnected = isConnected
        var result = 0
        n = isConnected.size
        isVisited = BooleanArray(n)
        for (i in 0 until n) {
            if (!isVisited[i]) {
                result++
                markVisited(i)
            }
        }
        return result
    }

    private fun markVisited(i: Int) {
        isVisited[i] = true
        for (j in 0 until n) {
            if (isConnected[i][j] == 1 && !isVisited[j]) {
                markVisited(j)
            }
        }
    }
}
