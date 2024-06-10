// https://leetcode.com/problems/height-checker/description/

class Solution {
    fun heightChecker(heights: IntArray): Int {
        val sortedHeights = heights.sorted()
        var result = 0
        for (i in heights.indices) {
            if (heights[i] != sortedHeights[i]) {
                result++
            }
        }
        return result
    }
}
