// https://leetcode.com/problems/symmetric-tree/description/

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
    fun isSymmetric(root: TreeNode?): Boolean {
        root?.left?.let { left ->
            root.right?.let { right ->
                return isSymmetric(left, right)
            } ?: run {
                return false
            }
        } ?: run {
            return root?.right == null
        }
    }
    
    private fun isSymmetric(l: TreeNode, r: TreeNode): Boolean {
        if (l.`val` != r.`val`) { return false }
        
        l.left?.let { left ->
            r.right?.let { right ->
                if (!isSymmetric(left, right)) {
                    return false
                }
            } ?: run {
                return false
            }
        } ?: run {
            if (r.right != null) {
                return false
            }
        }
        
        l.right?.let { right ->
            r.left?.let { left ->
                if (!isSymmetric(left, right)) {
                    return false
                }
            } ?: run {
                return false
            }
        } ?: run {
            if (r.left != null) {
                return false
            }
        }
        
        return true
    }
}
