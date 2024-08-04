// https://leetcode.com/problems/range-sum-of-sorted-subarray-sums/description/

class Solution {
    fun rangeSum(nums: IntArray, n: Int, left: Int, right: Int): Int {
        val list = mutableListOf<Int>()
        val n = nums.size
        for (i in nums.indices) {
            var sum = 0
            for (j in i until n) {
                sum += nums[j]
                list.add(sum)
            }
        }
        list.sort()
        var result = 0
        for (i in (left - 1) until right) {
            result = (result + list[i]) % 1000000007
        }
        return result
    }
}
