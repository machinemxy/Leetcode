// https://leetcode.com/problems/element-appearing-more-than-25-in-sorted-array/description/

class Solution {
    fun findSpecialInteger(arr: IntArray): Int {
        val standard = arr.size / 4
        var prevNum = -1
        var times = 0
        for (num in arr) {
            if (num == prevNum) {
                times++
            } else {
                prevNum = num
                times = 1
            }
            if (times > standard) {
                return prevNum
            }
        }
        return 0
    }
}
