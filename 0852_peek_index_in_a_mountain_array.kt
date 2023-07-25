// https://leetcode.com/problems/peak-index-in-a-mountain-array/description/

class Solution {
    fun peakIndexInMountainArray(arr: IntArray): Int {
        var l = 1
        var r = arr.size - 2
        while (l <= r) {
            val mid = (l + r) / 2
            val midVal = arr[mid]
            val prevVal = arr[mid - 1]
            val nextVal = arr[mid + 1]
            if (midVal > prevVal && nextVal > midVal) {
                l = mid + 1
            } else if (midVal < prevVal && nextVal < midVal) {
                r = mid - 1
            } else {
                return mid
            }
        }
        return l
    }
}
