// https://leetcode.com/problems/diameter-of-binary-tree/description/

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

class Solution {
    private var result = 0

    fun diameterOfBinaryTree(root: TreeNode?): Int {
        root?.let {
            getLength(it)
        }
        return result
    }

    private fun getLength(node: TreeNode): Int {
        var leftLength = 0
        var rightLength = 0
        node.left?.let {
            leftLength = getLength(it) + 1
        }
        node.right?.let {
            rightLength = getLength(it) + 1
        }
        result = max(result, leftLength + rightLength)
        return max(leftLength, rightLength)
    }
}
