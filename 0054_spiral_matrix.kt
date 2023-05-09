// https://leetcode.com/problems/spiral-matrix/description/

class Solution {
    fun spiralOrder(matrix: Array<IntArray>): List<Int> {
        var direction = Direction.RIGHT
        var leftBorder = 0
        var rightBorder = matrix[0].size - 1
        var topBorder = 0
        var bottomBorder = matrix.size - 1
        val result = mutableListOf<Int>()
        loop@while (true) {
            when (direction) {
                Direction.RIGHT -> {
                    for (x in leftBorder..rightBorder) {
                        result.add(matrix[topBorder][x])
                    }
                    if (topBorder == bottomBorder) {
                        break@loop
                    }
                    topBorder += 1
                    direction = Direction.DOWN
                }
                Direction.DOWN -> {
                    for (y in topBorder..bottomBorder) {
                        result.add(matrix[y][rightBorder])
                    }
                    if (leftBorder == rightBorder) {
                        break@loop
                    }
                    rightBorder -= 1
                    direction = Direction.LEFT
                }
                Direction.LEFT -> {
                    for (x in rightBorder downTo leftBorder) {
                        result.add(matrix[bottomBorder][x])
                    }
                    if (topBorder == bottomBorder) {
                        break@loop
                    }
                    bottomBorder -= 1
                    direction = Direction.UP
                }
                Direction.UP -> {
                    for (y in bottomBorder downTo topBorder) {
                        result.add(matrix[y][leftBorder])
                    }
                    if (leftBorder == rightBorder) {
                        break@loop
                    }
                    leftBorder += 1
                    direction = Direction.RIGHT
                }
            }
        }
        return result.toList()
    }
}

enum class Direction {
    LEFT, RIGHT, UP, DOWN
}
