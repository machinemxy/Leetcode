// https://leetcode.com/problems/maximum-product-of-two-elements-in-an-array/description/

class Solution {
    fun maxProduct(nums: IntArray): Int {
        nums.sortDescending()
        return (nums[0] - 1) * (nums[1] - 1)
    }
}
