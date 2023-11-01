// https://leetcode.com/problems/find-mode-in-binary-search-tree/description/

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
    private val map = mutableMapOf<Int, Int>()
    private var mostFrequency = 0
    private var nodes = mutableListOf<Int>()

    fun findMode(root: TreeNode?): IntArray {
        root?.let {
            solve(it)
        }
        return nodes.toIntArray()
    }

    private fun solve(node: TreeNode) {
        val value = node.`val`
        val newFrequency = map.getOrDefault(value, 0) + 1
        map[value] = newFrequency
        if (newFrequency == mostFrequency) {
            nodes.add(value)
        } else if (newFrequency > mostFrequency) {
            mostFrequency = newFrequency
            nodes = mutableListOf(value)
        }
        node.left?.let {
            solve(it)
        }
        node.right?.let {
            solve(it)
        }
    }
}
