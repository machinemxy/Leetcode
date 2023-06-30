// https://leetcode.com/problems/last-day-where-you-can-still-cross/description/

class Solution {
    fun latestDayToCross(row: Int, col: Int, cells: Array<IntArray>): Int {
        cells.forEach {
            it[0] -= 1
            it[1] -= 1
        }
        var l = 0
        var r = cells.size - 1
        while (l <= r) {
            val mid = (l + r) / 2
            if (isAbleToCross(row, col, cells, mid)) {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        return l
    }

    private fun isAbleToCross(row: Int, col: Int, cells: Array<IntArray>, day: Int): Boolean {
        val matrix = Array(row) { BooleanArray(col) }
        for (i in 0..day) {
            val cell = cells[i]
            val y = cell[0]
            val x = cell[1]
            matrix[y][x] = true
        }
        val deque = ArrayDeque<Pair<Int, Int>>()
        for (i in 0 until col) {
            if (!matrix[0][i]) {
                deque.add(Pair(0, i))
                matrix[0][i] = true
            }
        }
        while (deque.isNotEmpty()) {
            val pair = deque.removeFirst()
            if (!matrix[pair.first + 1][pair.second]) {
                if (pair.first == row - 2) {
                    return true
                } else {
                    deque.add(Pair(pair.first + 1, pair.second))
                    matrix[pair.first + 1][pair.second] = true
                }
            }
            if (pair.first > 0) {
                if (!matrix[pair.first - 1][pair.second]) {
                    deque.add(Pair(pair.first - 1, pair.second))
                    matrix[pair.first - 1][pair.second] = true
                }
            }
            if (pair.second > 0) {
                if (!matrix[pair.first][pair.second - 1]) {
                    deque.add(Pair(pair.first, pair.second - 1))
                    matrix[pair.first][pair.second - 1] = true
                }
            }
            if (pair.second < col - 1) {
                if (!matrix[pair.first][pair.second + 1]) {
                    deque.add(Pair(pair.first, pair.second + 1))
                    matrix[pair.first][pair.second + 1] = true
                }
            }
        }
        return false
    }
}
