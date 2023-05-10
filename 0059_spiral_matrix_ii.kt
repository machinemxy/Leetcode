// https://leetcode.com/problems/spiral-matrix-ii/description/

class Solution {
    fun generateMatrix(n: Int): Array<IntArray> {
        val matrix = Array(n) { IntArray(n) }
        var y = 0
        var x = 0
        var direction = Direction.RIGHT
        for (i in 1..n * n) {
            matrix[y][x] = i
            when (direction) {
                Direction.RIGHT -> {
                    if (x + 1 >= n || matrix[y][x + 1] != 0) {
                        direction = Direction.DOWN
                        y++
                    } else {
                        x++
                    }
                }
                Direction.DOWN -> {
                    if (y + 1 >=n || matrix[y + 1][x] != 0) {
                        direction = Direction.LEFT
                        x--
                    } else {
                        y++
                    }
                }
                Direction.LEFT -> {
                    if (x - 1 < 0 || matrix[y][x - 1] != 0) {
                        direction = Direction.UP
                        y--
                    } else {
                        x--
                    }
                }
                Direction.UP -> {
                    if (y - 1 < 0 || matrix[y - 1][x] != 0) {
                        direction = Direction.RIGHT
                        x++
                    } else {
                        y--
                    }
                }
            }
        }
        return matrix
    }
}

enum class Direction {
    LEFT, RIGHT, UP, DOWN
}
