// https://leetcode.com/problems/sum-of-all-subset-xor-totals/description/

class Solution {
    private var result = 0
    var nums = intArrayOf()
    
    fun subsetXORSum(nums: IntArray): Int {
        this.nums = nums
        calc(0, 0)
        return result
    }
    
    private fun calc(prevSum: Int, start: Int) {
        for (i in start until nums.size) {
            val tempSum = prevSum.xor(nums[i])
            result += tempSum
            calc(tempSum, i + 1)
        }
    }
}
