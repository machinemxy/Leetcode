// https://leetcode.com/problems/sum-of-left-leaves/description/

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
    private var sum = 0

    fun sumOfLeftLeaves(root: TreeNode?): Int {
        check(root!!)
        return sum
    }

    private fun check(node: TreeNode) {
        node.left?.let {
            if (it.left == null && it.right == null) {
                sum += it.`val`
            } else {
                check(it)
            }
        }
        node.right?.let {
            check(it)
        }
    }
}
