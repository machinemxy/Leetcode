// https://leetcode.com/problems/find-largest-value-in-each-tree-row/

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
    fun largestValues(root: TreeNode?): List<Int> {
        val result = mutableListOf<Int>()
        val deque = ArrayDeque<TreeNode>()
        root?.let {
            deque.add(it)
        }
        while (deque.isNotEmpty()) {
            var maxInLayer = Int.MIN_VALUE
            val n = deque.size
            for (i in 0 until n) {
                val node = deque.removeFirst()
                maxInLayer = max(maxInLayer, node.`val`)
                node.left?.let {
                    deque.add(it)
                }
                node.right?.let {
                    deque.add(it)
                }
            }
            result.add(maxInLayer)
        }
        return result.toList()
    }
}
