// https://leetcode.com/problems/divide-array-into-arrays-with-max-difference/description/

class Solution {
    fun divideArray(nums: IntArray, k: Int): Array<IntArray> {
        nums.sort()
        val size = nums.size / 3
        val result = Array<IntArray>(size) { IntArray(3) }
        var i = 0
        var j = 0
        for (num in nums) {
            if (j == 2) {
                if (num - result[i][0] > k) {
                    return arrayOf()
                }
            }
            result[i][j] = num
            if (j == 2) {
                j = 0
                i += 1
            } else {
                j += 1
            }
        }
        return result
    }
}
