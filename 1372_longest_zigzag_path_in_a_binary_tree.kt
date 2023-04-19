// https://leetcode.com/problems/longest-zigzag-path-in-a-binary-tree/description/

/**
 * Example:
 * var ti = TreeNode(5)
 * var v = ti.`val`
 * Definition for a binary tree node.
 * class TreeNode(var `val`: Int) {
 *     var left: TreeNode? = null
 *     var right: TreeNode? = null
 * }
 */
import kotlin.math.max

enum class Direction {
    LEFT, RIGHT
}

class Solution {
    var result = 0

    fun longestZigZag(root: TreeNode?): Int {
        root?.left?.let { 
            check(it, Direction.LEFT, 1)
        }
        root?.right?.let {
            check(it, Direction.RIGHT, 1)
        }
        return result
    }

    private fun check(node: TreeNode, direction: Direction, chain: Int) {
        result = max(chain, result)
        node.left?.let {
            val newChain = if (direction == Direction.RIGHT) {
                chain + 1
            } else {
                1
            }
            check(it, Direction.LEFT, newChain)
        }
        node.right?.let {
            val newChain = if (direction == Direction.LEFT) {
                chain + 1
            } else {
                1
            }
            check(it, Direction.RIGHT, newChain)
        }
    }
}
