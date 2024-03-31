// https://leetcode.com/problems/minimum-common-value/description/

class Solution {
    fun getCommon(nums1: IntArray, nums2: IntArray): Int {
        val set2 = nums2.toSet()
        nums1.sort()
        for (num in nums1) {
            if (set2.contains(num)) {
                return num
            }
        }
        return -1
    }
}
