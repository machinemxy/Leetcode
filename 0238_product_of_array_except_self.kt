// https://leetcode.com/problems/product-of-array-except-self/description/

class Solution {
    fun productExceptSelf(nums: IntArray): IntArray {
        var totalProduct = 1
        var zeroCount = 0
        for (num in nums) {
            if (num == 0) {
                zeroCount++
            } else {
                totalProduct *= num
            }
        }
        if (zeroCount > 1) {
            return IntArray(nums.size)
        } else if (zeroCount == 1) {
            for (i in nums.indices) {
                val num = nums[i]
                if (num == 0) {
                    nums[i] = totalProduct
                } else {
                    nums[i] = 0
                }
            }
            return nums
        } else {
            for (i in nums.indices) {
                val num = nums[i]
                nums[i] = totalProduct / num
            }
            return nums
        }
    }
}
