// https://leetcode.com/problems/binary-search/description/

class Solution {
    fun search(nums: IntArray, target: Int): Int {
        var l = 0
        var r = nums.size - 1
        while (l <= r) {
            val mid = (l + r) / 2
            val midNum = nums[mid]
            if (target <= midNum) {
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        if (l < nums.size && nums[l] == target) {
            return l
        } else {
            return -1
        }
    }
}
