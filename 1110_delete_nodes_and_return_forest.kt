// https://leetcode.com/problems/delete-nodes-and-return-forest/description/

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
    val result = mutableListOf<TreeNode>()

    fun delNodes(root: TreeNode?, to_delete: IntArray): List<TreeNode?> {
        root?.let {
            check(it, to_delete.toSet(), true, null, true)
        }
        return result
    }

    private fun check(node: TreeNode, toDelete: Set<Int>, isRoot: Boolean, parent: TreeNode?, isParentsLeft: Boolean) {
        if (toDelete.contains(node.`val`)) {
            if (isParentsLeft) {
                parent?.left = null
            } else {
                parent?.right = null
            }
            node.left?.let {
                check(it, toDelete, true, node, true)
            }
            node.right?.let {
                check(it, toDelete, true, node, false)
            }
        } else {
            if (isRoot) {
                result.add(node)
            }
            node.left?.let {
                check(it, toDelete, false, node, true)
            }
            node.right?.let {
                check(it, toDelete, false, node, false)
            }
        }
    }
}
