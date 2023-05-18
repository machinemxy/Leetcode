// https://leetcode.com/problems/minimum-number-of-vertices-to-reach-all-nodes/description/

class Solution {
    fun findSmallestSetOfVertices(n: Int, edges: List<List<Int>>): List<Int> {
        val beingConnectedByOtherNode = BooleanArray(n)
        for (edge in edges) {
            beingConnectedByOtherNode[edge[1]] = true
        }
        val result = mutableListOf<Int>()
        beingConnectedByOtherNode.forEachIndexed { i, connected -> 
            if (!connected) {
                result.add(i)
            }
        }
        return result.toList()
    }
}
