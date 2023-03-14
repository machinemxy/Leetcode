// https://leetcode.com/problems/sum-root-to-leaf-numbers/description/

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
    fun sumNumbers(root: TreeNode?): Int {
        val strings = getNumbers(root!!)
        var sum = 0
        for (s in strings) {
            sum += s.toInt()
        }
        return sum
    }

    private fun getNumbers(node: TreeNode): ArrayList<String> {
        if (node.left == null && node.right == null) {
            return arrayListOf(node.`val`.toString())
        }
        
        val result = arrayListOf<String>()
        node.left?.let {
            val leftResult = getNumbers(it)
            result += leftResult
        }
        node.right?.let {
            val rightResult = getNumbers(it)
            result += rightResult
        }
        for (i in result.indices) {
            result[i] = node.`val`.toString() + result[i]
        }
        return result
    }
}
