// https://leetcode.com/problems/sort-array-by-parity/

class Solution {
    fun sortArrayByParity(nums: IntArray): IntArray {
        val numsList = nums.toMutableList()
        val n = numsList.size
        var i = 0
        for (j in 0 until n) {
            val num = numsList[i]
            if (num % 2 == 0) {
                i++
            } else {
                numsList.removeAt(i)
                numsList.add(num)
            }
        }
        return numsList.toIntArray()
    }
}
