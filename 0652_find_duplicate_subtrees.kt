// https://leetcode.com/problems/find-duplicate-subtrees/description/

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
    private var idMap: MutableMap<NodeDescriber, Int> = mutableMapOf()
    private var resultMap: MutableMap<NodeDescriber, TreeNode> = mutableMapOf()
    private var idGenerator = 0

    fun findDuplicateSubtrees(root: TreeNode?): List<TreeNode?> {
        getNodeId(root!!)
        return resultMap.values.toList()
    }

    private fun getNodeId(node: TreeNode): Int? {
        val leftId = node.left?.let(::getNodeId)
        val rightId = node.right?.let(::getNodeId)
        val nodeDescriber = NodeDescriber(node.`val`, leftId, rightId)
        if (idMap.keys.contains(nodeDescriber)) {
            if (!resultMap.keys.contains(nodeDescriber)) {
                resultMap[nodeDescriber] = node
            }
            return idMap[nodeDescriber]
        } else {
            val id = idGenerator
            idMap[nodeDescriber] = id
            idGenerator++
            return id
        }
    }
}

data class NodeDescriber(
    val value: Int,
    val leftId: Int?,
    val rightId: Int?
)
