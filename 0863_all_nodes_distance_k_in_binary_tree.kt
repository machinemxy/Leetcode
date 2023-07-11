// https://leetcode.com/problems/all-nodes-distance-k-in-binary-tree/description/

/**
 * Definition for a binary tree node.
 * class TreeNode(var `val`: Int = 0) {
 *     var left: TreeNode? = null
 *     var right: TreeNode? = null
 * }
 */
class Solution {
    fun distanceK(root: TreeNode?, target: TreeNode?, k: Int): List<Int> {
        val paths = mutableMapOf<Int, MutableSet<Int>>()
        val deque = ArrayDeque<TreeNode>()
        deque.add(root!!)
        while (deque.isNotEmpty()) {
            val node = deque.removeFirst()
            node.left?.let { left ->
                paths.getOrPut(node.`val`) { mutableSetOf() }.add(left.`val`)
                paths.getOrPut(left.`val`) { mutableSetOf() }.add(node.`val`)
                deque.add(left)
            }
            node.right?.let { right ->
                paths.getOrPut(node.`val`) { mutableSetOf() }.add(right.`val`)
                paths.getOrPut(right.`val`) { mutableSetOf() }.add(node.`val`)
                deque.add(right)
            }
        }
        val result = ArrayDeque<Int>()
        result.add(target!!.`val`)
        val visited = mutableSetOf<Int>()
        visited.add(target!!.`val`)
        var restK = k
        while (restK > 0) {
            val n = result.size
            for (i in 1..n) {
                val node = result.removeFirst()
                paths[node]?.forEach {
                    if (!visited.contains(it)) {
                        visited.add((it))
                        result.add(it)
                    }
                }
            }
            restK--
        }
        return result.toList()
    }
}
