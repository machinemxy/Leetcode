// https://leetcode.com/problems/intersection-of-two-arrays-ii/description/

class Solution {
    fun intersect(nums1: IntArray, nums2: IntArray): IntArray {
        nums1.sort()
        nums2.sort()
        val n1 = nums1.size
        val n2 = nums2.size
        var i1 = 0
        var i2 = 0
        var result = mutableListOf<Int>()
        while (i1 < n1 && i2 < n2) {
            if (nums1[i1] == nums2[i2]) {
                result.add(nums1[i1])
                i1++
                i2++
            } else if (nums1[i1] < nums2[i2]) {
                i1++
            } else {
                i2++
            }
        }
        return result.toIntArray()
    }
}
