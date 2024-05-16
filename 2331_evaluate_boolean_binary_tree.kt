// https://leetcode.com/problems/evaluate-boolean-binary-tree/description/

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
    fun evaluateTree(root: TreeNode?): Boolean {
        return check(root!!)
    }

    private fun check(node: TreeNode): Boolean {
        if (node.`val` == 0) {
            return false
        } else if (node.`val` == 1) {
            return true
        } else if (node.`val` == 2) {
            var leftResult = false
            var rightResult = false
            node.left?.let { 
                leftResult = check(it)
            }
            node.right?.let {
                rightResult = check(it)
            }
            return leftResult || rightResult
        } else {
            var leftResult = false
            var rightResult = false
            node.left?.let {
                leftResult = check(it)
            }
            node.right?.let {
                rightResult = check(it)
            }
            return leftResult && rightResult
        }
    }
}
