// https://leetcode.com/problems/construct-binary-tree-from-inorder-and-postorder-traversal/description/

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
    fun buildTree(inorder: IntArray, postorder: IntArray): TreeNode? {
        val order = inorder.toMutableList()
        val stack = ArrayList<TreeNode>()
        for (value in postorder) {
            stack.add(TreeNode(value))
            while (stack.size >= 2) {
                val count = stack.size
                val node1 = stack[count - 2]
                val node2 = stack[count - 1]
                val node1Id = order.indexOfFirst { it == node1.`val` }!!
                val node2Id = order.indexOfFirst { it == node2.`val` }!!
                if (node1Id == node2Id - 1) {
                    node2.left = node1
                    stack.removeAt(count - 2)
                    order.remove(node1.`val`)
                } else if (node1Id == node2Id + 1) {
                    node2.right = node1
                    stack.removeAt(count - 2)
                    order.remove(node1.`val`)
                } else {
                    break
                }
            }
        }
        return stack[0]
    }
}
