// https://leetcode.com/problems/even-odd-tree/description/

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
    fun isEvenOddTree(root: TreeNode?): Boolean {
        val deque = ArrayDeque<TreeNode>()
        root?.let { deque.add(it) }
        var isOdd = true
        while (deque.isNotEmpty()) {
            val n = deque.size
            var currentValue = if (isOdd) {
                Int.MIN_VALUE
            } else {
                Int.MAX_VALUE
            }
            for (i in 0 until n) {
                val node = deque.removeFirst()
                val value = node.`val`
                if (isOdd) {
                    if (value % 2 != 1 || value <= currentValue) {
                        return false
                    }
                } else {
                    if (value % 2 != 0 || value >= currentValue) {
                        return false
                    }
                }
                currentValue = value
                node.left?.let {
                    deque.add(it)
                }
                node.right?.let {
                    deque.add(it)
                }
            }
            isOdd = !isOdd
        }
        return true
    }
}
