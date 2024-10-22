// https://leetcode.com/problems/kth-largest-sum-in-a-binary-tree/description/

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
import java.util.PriorityQueue

class Solution {
    fun kthLargestLevelSum(root: TreeNode?, k: Int): Long {
        val sumQueue = PriorityQueue<Long>(compareByDescending { it })
        val deque = ArrayDeque<TreeNode>()
        deque.add(root!!)
        while (deque.isNotEmpty()) {
            val n = deque.size
            var sum = 0L
            for (i in 0 until n) {
                val node = deque.removeFirst()
                sum += node.`val`
                node.left?.let { deque.add(it) }
                node.right?.let { deque.add(it) }
            }
            sumQueue.add(sum)
        }
        if (sumQueue.size < k) {
            return -1
        }
        for (i in 1 until k) {
            sumQueue.poll()
        }
        return sumQueue.poll()
    }
}
