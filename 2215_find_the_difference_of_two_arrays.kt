// https://leetcode.com/problems/find-the-difference-of-two-arrays/description/

class Solution {
    fun findDifference(nums1: IntArray, nums2: IntArray): List<List<Int>> {
        val set1 = nums1.toSet()
        val set2 = nums2.toSet()
        val answer1 = mutableListOf<Int>()
        val answer2 = mutableListOf<Int>()
        for (num in set1) {
            if (!set2.contains(num)) {
                answer1.add(num)
            }
        }
        for (num in set2) {
            if(!set1.contains(num)) {
                answer2.add(num)
            }
        }
        return listOf(answer1.toList(), answer2.toList()) 
    }
}
