// https://leetcode.com/problems/rotting-oranges/description/

class Solution {
    fun orangesRotting(grid: Array<IntArray>): Int {
        val rowCount = grid.size
        val colCount = grid[0].size
        var freshOrangeCount = 0
        val rottenOrangePositions = ArrayDeque<Position>()
        var time = 0
        for (y in 0 until rowCount) {
            for (x in 0 until colCount) {
                val orange = grid[y][x]
                if (orange == 1) {
                    freshOrangeCount++
                } else if (orange == 2) {
                    rottenOrangePositions.add(Position(y, x))
                }
            }
        }
        if (freshOrangeCount == 0) {
            return 0
        }
        while (rottenOrangePositions.isNotEmpty()) {
            time++
            val count = rottenOrangePositions.size
            for (i in 0 until count) {
                val rottenOrangePosition = rottenOrangePositions.removeFirst()
                val y = rottenOrangePosition.y
                val x = rottenOrangePosition.x
                if (y > 0 && grid[y - 1][x] == 1) {
                    grid[y - 1][x] = 2
                    rottenOrangePositions.add(Position(y - 1, x))
                    freshOrangeCount--
                }
                if (y < rowCount - 1 && grid[y + 1][x] == 1) {
                    grid[y + 1][x] = 2
                    rottenOrangePositions.add(Position(y + 1, x))
                    freshOrangeCount--
                }
                if (x > 0 && grid[y][x - 1] == 1) {
                    grid[y][x - 1] = 2
                    rottenOrangePositions.add(Position(y, x - 1))
                    freshOrangeCount--
                }
                if (x < colCount - 1 && grid[y][x + 1] == 1) {
                    grid[y][x + 1] = 2
                    rottenOrangePositions.add(Position(y, x + 1))
                    freshOrangeCount--
                }
            }
            if (freshOrangeCount == 0) {
                return time
            }
        }
        return -1
    }
}

data class Position(
    val y: Int,
    val x: Int
)
