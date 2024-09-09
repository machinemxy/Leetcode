// https://leetcode.com/problems/spiral-matrix-iv/description/

/**
 * Example:
 * var li = ListNode(5)
 * var v = li.`val`
 * Definition for singly-linked list.
 * class ListNode(var `val`: Int) {
 *     var next: ListNode? = null
 * }
 */
class Solution {
    fun spiralMatrix(m: Int, n: Int, head: ListNode?): Array<IntArray> {
        val matrix = Array(m) { IntArray(n) { -1 } }
        var node = head
        var y = 0
        var x = 0
        var direction = Direction.RIGHT
        var rightBorder = n - 1
        var upBorder = 1
        var downBorder = m - 1
        var leftBorder = 0
        while (node != null) {
            matrix[y][x] = node.`val`
            node = node.next
            when (direction) {
                Direction.LEFT -> {
                    if (x > leftBorder) {
                        x--
                    } else {
                        leftBorder++
                        y--
                        direction = Direction.UP
                    }
                }
                Direction.RIGHT -> {
                    if (x < rightBorder) {
                        x++
                    } else {
                        rightBorder--
                        y++
                        direction = Direction.DOWN
                    }
                }
                Direction.UP -> {
                    if (y > upBorder) {
                        y--
                    } else {
                        upBorder++
                        x++
                        direction = Direction.RIGHT
                    }
                }
                Direction.DOWN -> {
                    if (y < downBorder) {
                        y++
                    } else {
                        downBorder--
                        x--
                        direction = Direction.LEFT
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
