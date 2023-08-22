// https://leetcode.com/problems/excel-sheet-column-title/description/

class Solution {
    fun convertToTitle(columnNumber: Int): String {
        var number = columnNumber
        var result = ""
        while (true) {
            number--
            val n = number % 26
            val c = numberToChar(n)
            result = c + result
            number /= 26
            if (number == 0) {
                break
            }
        }
        return result
    }

    private fun numberToChar(n: Int): Char {
        return ('A' + n).toChar()
    }
}
