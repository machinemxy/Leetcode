// https://leetcode.com/problems/minimum-depth-of-binary-tree/description/

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
    fun minDepth(root: TreeNode?): Int {
        var depth = 1
        val deque = ArrayDeque<TreeNode>()
        if (root == null) {
            return 0
        }
        deque.add(root!!)
        while (true) {
            val count = deque.size
            for (i in 1..count) {
                val node = deque.removeFirst()
                if (node.left == null && node.right == null) {
                    return depth
                } else {
                    node.left?.let {
                        deque.add(it)
                    }
                    node.right?.let {
                        deque.add(it)
                    }
                }
            }
            depth++
        }
    }
}
