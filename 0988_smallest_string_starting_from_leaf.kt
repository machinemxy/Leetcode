// https://leetcode.com/problems/smallest-string-starting-from-leaf/description/

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
    private var result = ""

    fun smallestFromLeaf(root: TreeNode?): String {
        check(root!!, "")
        return result
    }

    private fun check(node: TreeNode, prevString: String) {
        val currentChar = 'a' + node.`val`
        val currentString = prevString + currentChar
        if (node.left == null && node.right == null) {
            val reversedString = currentString.reversed()
            if (result == "") {
                result = reversedString
            } else if (reversedString < result) {
                result = reversedString
            }
        } else {
            node.left?.let {
                check(it, currentString)
            }
            node.right?.let {
                check(it, currentString)
            }
        }
    }
}
