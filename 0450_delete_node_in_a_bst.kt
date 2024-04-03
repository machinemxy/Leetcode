// https://leetcode.com/problems/delete-node-in-a-bst/description/

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
    fun deleteNode(root: TreeNode?, key: Int): TreeNode? {
        val realRoot = TreeNode(Int.MAX_VALUE)
        realRoot.left = root
        var node = realRoot
        while (true) {
            if (key < node.`val`) {
                val left = node.left ?: break
                if (left.`val` == key) {
                    remove(left, node)
                    break
                }
                node = left
            } else {
                val right = node.right ?: break
                if (right.`val` == key) {
                    remove(right, node)
                    break
                }
                node = right
            }
        }
        return realRoot.left
    }

    private fun remove(node: TreeNode, parent: TreeNode) {
        val left = node.left
        val right = node.right
        if (left == null && right == null) {
            if (node.`val` < parent.`val`) {
                parent.left = null
            } else {
                parent.right = null
            }
        } else if (left == null) {
            if (node.`val` < parent.`val`) {
                parent.left = right
            } else {
                parent.right = right
            }
        } else if (right == null) {
            if (node.`val` < parent.`val`) {
                parent.left = left
            } else {
                parent.right = left
            }
        } else {
            if (node.`val` < parent.`val`) {
                parent.left = left
            } else {
                parent.right = left
            }
            var mostRightNodeInLeft = left!!
            while (true) {
                if (mostRightNodeInLeft.right != null) {
                    mostRightNodeInLeft = mostRightNodeInLeft.right!!
                } else {
                    break
                }
            }
            mostRightNodeInLeft.right = right
        }
    }
}
