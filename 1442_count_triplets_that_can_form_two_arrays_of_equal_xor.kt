// https://leetcode.com/problems/count-triplets-that-can-form-two-arrays-of-equal-xor/description/

class Solution {
    fun countTriplets(arr: IntArray): Int {
        var result = 0
        for (i in 0 until arr.size - 1) {
            var value = arr[i]
            for (j in i + 1 until arr.size) {
                value = value xor arr[j]
                if (value == 0) {
                    result += j - i
                }
            }
        }
        return result
    }
}
