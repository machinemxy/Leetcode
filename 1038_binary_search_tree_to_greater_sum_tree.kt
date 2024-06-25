// https://leetcode.com/problems/binary-search-tree-to-greater-sum-tree/description/

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
class Solution {
    private var value = 0

    fun bstToGst(root: TreeNode?): TreeNode? {
        if (root == null) {
            return null
        }
        set(root)
        return root
    }

    private fun set(node: TreeNode) {
        node.right?.let {
            set(it)
        }
        value += node.`val`
        node.`val` = value
        node.left?.let {
            set(it)
        }
    }
}
