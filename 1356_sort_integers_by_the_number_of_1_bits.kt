// https://leetcode.com/problems/sort-integers-by-the-number-of-1-bits/description/

class Solution {
    fun sortByBits(arr: IntArray): IntArray {
        return arr.sortedWith(
            compareBy<Int> { get1s(it) }.thenBy { it }
        ).toIntArray()
    }

    private fun get1s(num: Int): Int {
        var count1s = 0
        var restNum = num
        while (restNum > 0) {
            if (restNum % 2 == 1) {
                count1s++
            }
            restNum /= 2
        }
        return count1s
    }
}
