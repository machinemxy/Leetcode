// https://leetcode.com/problems/single-number-ii/description/

class Solution {
    fun singleNumber(nums: IntArray): Int {
        var once = 0
        var twice = 0
        for (num in nums) {
            once = (once xor num) and twice.inv()
            twice = (twice xor num) and once.inv()
        }
        return once
    }
}
