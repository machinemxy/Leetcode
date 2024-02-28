// https://leetcode.com/problems/find-bottom-left-tree-value/description/

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
    fun findBottomLeftValue(root: TreeNode?): Int {
        var result = 0
        val deque = ArrayDeque<TreeNode>()
        root?.let { deque.add(it) }
        while (deque.isNotEmpty()) {
            result = deque.first().`val`
            val n = deque.size
            for (i in 0 until n) {
                val node = deque.removeFirst()
                node.left?.let { deque.add(it) }
                node.right?.let { deque.add(it) }
            }
        }
        return result
    }
}
