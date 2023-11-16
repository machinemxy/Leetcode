// https://leetcode.com/problems/find-unique-binary-string/description/

class Solution {
    fun findDifferentBinaryString(nums: Array<String>): String {
        val set = nums.toSet()
        val n = nums[0].length
        val array = CharArray(n)
        for (i in array.indices) {
            array[i] = '0'
        }
        while (true) {
            val string = String(array)
            if (!set.contains(string)) {
                return string
            }
            next(array)
        }
    }

    private fun next(array: CharArray) {
        var i = array.size - 1
        while (true) {
            if (array[i] == '0') {
                array[i] = '1'
                break
            } else {
                array[i] = '0'
                i--
            }
        }
    }
}
