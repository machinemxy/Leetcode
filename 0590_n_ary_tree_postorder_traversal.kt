// https://leetcode.com/problems/n-ary-tree-postorder-traversal/description/

/**
 * Definition for a Node.
 * class Node(var `val`: Int) {
 *     var children: List<Node?> = listOf()
 * }
 */

class Solution {
    val result = mutableListOf<Int>()

    fun postorder(root: Node?): List<Int> {
        root?.let {
            travel(it)
        }
        return result
    }

    private fun travel(node: Node) {
        for (child in node.children) {
            child?.let { 
                travel(it)
            }
        }
        result.add(node.`val`)
    }
}
