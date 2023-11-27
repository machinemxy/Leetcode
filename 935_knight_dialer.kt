// https://leetcode.com/problems/knight-dialer/description/

class Solution {
    private val modulo = 1000000007L

    fun knightDialer(n: Int): Int {
        if (n == 1) { return 10 }
        var array = LongArray(10) { 1L }
        var i = 1
        while (i < n) {
            array = step(array)
            i++
        }
        var result = 0L
        for (i in 0 .. 9) {
            result += array[i]
        }
        return (result % 1000000007L).toInt()
    }

    private fun step(array: LongArray): LongArray {
        val newArray = LongArray(10)
        newArray[4] += array[0]
        newArray[6] += array[0]
        newArray[6] += array[1]
        newArray[8] += array[1]
        newArray[7] += array[2]
        newArray[9] += array[2]
        newArray[4] += array[3]
        newArray[8] += array[3]
        newArray[3] += array[4]
        newArray[9] += array[4]
        newArray[0] += array[4]
        newArray[1] += array[6]
        newArray[7] += array[6]
        newArray[0] += array[6]
        newArray[2] += array[7]
        newArray[6] += array[7]
        newArray[1] += array[8]
        newArray[3] += array[8]
        newArray[2] += array[9]
        newArray[4] += array[9]
        for (i in 0 .. 9) {
            newArray[i] %= modulo
        }
        return newArray
    }
}
