// https://leetcode.com/problems/construct-quad-tree/description/

/**
 * Definition for a QuadTree node.
 * class Node(var `val`: Boolean, var isLeaf: Boolean) {
 *     var topLeft: Node? = null
 *     var topRight: Node? = null
 *     var bottomLeft: Node? = null
 *     var bottomRight: Node? = null
 * }
 */

class Solution {
    private var grid: Array<IntArray> = arrayOf()

    fun construct(grid: Array<IntArray>): Node? {
        if (grid.isEmpty()) { return null }
        this.grid = grid
        return convertToNode(0, grid[0].size, 0, grid.size)
    }

    private fun convertToNode(yFrom: Int, yTo:Int, xFrom: Int, xTo: Int): Node {
        if (yTo - yFrom == 1) {
            val value = grid[yFrom][xFrom] == 1
            return Node(value, true)
        }
        val xMid = xFrom + (xTo - xFrom) / 2
        val yMid = yFrom + (yTo - yFrom) / 2
        val topLeftNode = convertToNode(yFrom, yMid, xFrom, xMid)
        val topRightNode = convertToNode(yFrom, yMid, xMid, xTo)
        val bottomLeftNode = convertToNode(yMid, yTo, xFrom, xMid)
        val bottomRightNode = convertToNode(yMid, yTo, xMid, xTo)
        if (topLeftNode.isLeaf
            && topRightNode.isLeaf
            && bottomLeftNode.isLeaf
            && bottomRightNode.isLeaf
            && topLeftNode.`val` == topRightNode.`val`
            && topLeftNode.`val` == bottomLeftNode.`val`
            && topLeftNode.`val` == bottomRightNode.`val`) {
            return Node(topLeftNode.`val`, true)
        } else {
            val node = Node(true, false)
            node.topLeft = topLeftNode
            node.topRight = topRightNode
            node.bottomLeft = bottomLeftNode
            node.bottomRight = bottomRightNode
            return node
        }
    }
}
