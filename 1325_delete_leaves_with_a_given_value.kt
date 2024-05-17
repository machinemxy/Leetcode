// https://leetcode.com/problems/delete-leaves-with-a-given-value/description/

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
    private var target = 0
    
    fun removeLeafNodes(root: TreeNode?, target: Int): TreeNode? {
        this.target = target
        val realRoot = TreeNode(Int.MAX_VALUE)
        realRoot.left = root
        check(root!!, realRoot, true)
        return realRoot.left
    }

    private fun check(node: TreeNode, parent: TreeNode, isLeft: Boolean) {
        node.left?.let {
            check(it, node, true)
        }
        node.right?.let {
            check(it, node, false)
        }
        if (node.`val` == target && node.left == null && node.right == null) {
            if (isLeft) {
                parent.left = null
            } else {
                parent.right = null
            }
        }
    }
}
