// https://leetcode.com/problems/single-number-iii/description/

class Solution {
    fun singleNumber(nums: IntArray): IntArray {
        val set = mutableSetOf<Int>()
        for (num in nums) {
            if (set.contains(num)) {
                set.remove(num)
            } else {
                set.add(num)
            }
        }
        return set.toIntArray()
    }
}
