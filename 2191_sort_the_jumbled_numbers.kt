// https://leetcode.com/problems/sort-the-jumbled-numbers/description/

class Solution {
    fun sortJumbled(mapping: IntArray, nums: IntArray): IntArray {
        val mapMap = mutableMapOf<Int, Int>()
        val orderMap = mutableMapOf<Int, Int>()
        nums.forEachIndexed { index, num ->
            mapMap[num] = map(num, mapping)
            orderMap[num] = index
        }
        return nums.sortedWith(
            compareBy<Int> { mapMap[it] }
                .thenBy { orderMap[it] }
        ).toIntArray()
    }

    private fun map(num: Int, mapping: IntArray): Int {
        if (num == 0) {
            return mapping[0]
        }
        var multiplier = 1
        var temp = num
        var result = 0
        while (temp > 0) {
            val lastNum = temp % 10
            result += mapping[lastNum] * multiplier
            multiplier *= 10
            temp /= 10
        }
        return result
    }
}
