// https://leetcode.com/problems/maximum-level-sum-of-a-binary-tree/description/

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
    fun maxLevelSum(root: TreeNode?): Int {
        var maxSum = Int.MIN_VALUE
        var maxLevel = 0
        val deque = ArrayDeque<TreeNode>()
        deque.add(root!!)
        var currentLevel = 1
        while (deque.isNotEmpty()) {
            var sum = 0
            var count = deque.size
            for (i in 1..count) {
                val node = deque.removeFirst()
                sum += node.`val`
                node.left?.let {
                    deque.add(it)
                }
                node.right?.let {
                    deque.add(it)
                }
            }
            if (sum > maxSum) {
                maxSum = sum
                maxLevel = currentLevel
            }
            currentLevel++
        }
        return maxLevel
    }
}
