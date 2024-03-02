// https://leetcode.com/problems/squares-of-a-sorted-array/description/

class Solution {
    fun sortedSquares(nums: IntArray): IntArray {
        return nums.map {
            it * it
        }.sorted().toIntArray()
    }
}
