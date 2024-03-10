// https://leetcode.com/problems/intersection-of-two-arrays/description/

class Solution {
    fun intersection(nums1: IntArray, nums2: IntArray): IntArray {
        val result = mutableListOf<Int>()
        val set1 = nums1.toSet()
        var set2 = nums2.toSet()
        for (num in set1) {
            if (set2.contains(num)) {
                result.add(num)
            }
        }
        return result.toIntArray()
    }
}
