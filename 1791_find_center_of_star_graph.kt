// https://leetcode.com/problems/find-center-of-star-graph/description/

class Solution {
    fun findCenter(edges: Array<IntArray>): Int {
        return if (edges[1].contains(edges[0][0])) {
            edges[0][0]
        } else {
            edges[0][1]
        }
    }
}
