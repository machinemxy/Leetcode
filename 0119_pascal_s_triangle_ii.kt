// https://leetcode.com/problems/pascals-triangle-ii/

class Solution {
    fun getRow(rowIndex: Int): List<Int> {
        if (rowIndex == 0) {
            return listOf(1)
        } else if (rowIndex == 1) {
            return listOf(1, 1)
        }
        var prevRow = listOf(1, 1)
        for (i in 2 .. rowIndex) {
            val newRow = mutableListOf(1)
            for (j in 1 until prevRow.size) {
                newRow.add(prevRow[j - 1] + prevRow[j])
            }
            newRow.add(1)
            prevRow = newRow
        }
        return prevRow
    }
}
