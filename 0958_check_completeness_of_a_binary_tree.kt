// https://leetcode.com/problems/check-completeness-of-a-binary-tree/description/

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
    fun isCompleteTree(root: TreeNode?): Boolean {
        val nodes = arrayListOf<TreeNode?>(root)
        while (nodes.isNotEmpty()) {
            val nodesCount = nodes.size
            for (i in 1..nodesCount) {
                val node = nodes[0]
                nodes.removeAt(0)
                node?.let {
                    nodes.add(it.left)
                    nodes.add(it.right)
                } ?: run {
                    for (j in (i + 1)..nodesCount) {
                        val node = nodes[0]
                        nodes.removeAt(0)
                        if (node != null) {
                            return false
                        }
                    }
                    for (node in nodes) {
                        if (node != null) {
                            return false
                        }
                    }
                    return true
                }
            }
        }
        return true
    }
}
