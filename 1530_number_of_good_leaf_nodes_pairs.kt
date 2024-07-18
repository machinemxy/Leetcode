// https://leetcode.com/problems/number-of-good-leaf-nodes-pairs/description/

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
    var result = 0

    fun countPairs(root: TreeNode?, distance: Int): Int {
        check(root!!, distance)
        return result
    }

    fun check(node: TreeNode, distance: Int): Map<Int, Int> {
        var leftMap = mapOf<Int, Int>()
        var rightMap = mapOf<Int, Int>()
        var isLeaf = true
        node.left?.let {
            isLeaf = false
            leftMap = check(it, distance)
        }
        node.right?.let {
            isLeaf = false
            rightMap = check(it, distance)
        }
        if (isLeaf) {
            return mapOf(1 to 1)
        }
        for (leftPair in leftMap) {
            for (rightPair in rightMap) {
                if (leftPair.key + rightPair.key <= distance) {
                    result += leftPair.value * rightPair.value
                }
            }
        }
        val map = mutableMapOf<Int, Int>()
        for (pair in leftMap) {
            val newKey = pair.key + 1
            if (newKey < distance) {
                map[newKey] = map.getOrDefault(newKey, 0) + pair.value
            }
        }
        for (pair in rightMap) {
            val newKey = pair.key + 1
            if (newKey < distance) {
                map[newKey] = map.getOrDefault(newKey, 0) + pair.value
            }
        }
        return map
    }
}
