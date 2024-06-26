// https://leetcode.com/problems/balance-a-binary-search-tree/description/

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
    fun balanceBST(root: TreeNode?): TreeNode? {
        val array = connectToArray(root!!)
        return rearrangeNode(array, 0, array.size - 1)
    }

    private fun connectToArray(node: TreeNode): Array<TreeNode> {
        var array = arrayOf(node)
        node.left?.let {
            val left = connectToArray(it)
            array = left + array
        }
        node.right?.let {
            val right = connectToArray(it)
            array += right
        }
        return array
    }
    
    private fun rearrangeNode(array: Array<TreeNode>, l: Int, r: Int): TreeNode? {
        if (l > r) {
            return null
        }
        val mid = (l + r) / 2
        val root = array[mid]
        val leftNode = rearrangeNode(array, l, mid - 1)
        val rightNode = rearrangeNode(array, mid + 1, r)
        root.left = leftNode
        root.right = rightNode
        return root
    }
}
