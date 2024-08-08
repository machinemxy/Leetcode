// https://leetcode.com/problems/spiral-matrix-iii/description/

class Solution {
    fun spiralMatrixIII(rows: Int, cols: Int, rStart: Int, cStart: Int): Array<IntArray> {
        var y = rStart
        var x = cStart
        var minY = y
        var maxY = y
        var minX = x
        var maxX = x + 1
        var direction = Direction.RIGHT
        var result = mutableListOf<IntArray>()
        val cellCount = rows * cols
        while (result.size < cellCount) {
            if (direction == Direction.RIGHT) {
                while (x < maxX) {
                    if (isInMatrix(y, x, rows, cols)) {
                        result.add(intArrayOf(y, x))
                    }
                    x++
                }
                maxY++
                direction = Direction.DOWN
            } else if (direction == Direction.DOWN) {
                while (y < maxY) {
                    if (isInMatrix(y, x, rows, cols)) {
                        result.add(intArrayOf(y, x))
                    }
                    y++
                }
                minX--
                direction = Direction.LEFT
            } else if (direction == Direction.LEFT) {
                while (x > minX) {
                    if (isInMatrix(y, x, rows, cols)) {
                        result.add(intArrayOf(y, x))
                    }
                    x--
                }
                minY--
                direction = Direction.UP
            } else {
                while (y > minY) {
                    if (isInMatrix(y, x, rows, cols)) {
                        result.add(intArrayOf(y, x))
                    }
                    y--
                }
                maxX++
                direction = Direction.RIGHT
            }
        }
        return result.toTypedArray()
    }

    private fun isInMatrix(y: Int, x: Int, rows: Int, cols: Int): Boolean {
        return !(y < 0 || y >= rows || x < 0 || x >= cols)
    }
}

enum class Direction {
    UP, DOWN, LEFT, RIGHT
}
