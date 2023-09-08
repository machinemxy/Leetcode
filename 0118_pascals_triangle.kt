// https://leetcode.com/problems/pascals-triangle/description/

class Solution {
    fun generate(numRows: Int): List<List<Int>> {
        if (numRows == 1) {
            return listOf(listOf(1))
        } else if (numRows == 2) {
            return listOf(listOf(1), listOf(1, 1))
        }
        val result = ArrayDeque<List<Int>>()
        result.add(listOf(1))
        result.add(listOf(1, 1))
        for (i in 3 .. numRows) {
            val lastList = result.last()
            val newList = mutableListOf(1)
            for (j in 1 until lastList.size) {
                newList.add(lastList[j - 1] + lastList[j])
            }
            newList.add(1)
            result.add(newList.toList())
        }
        return result.toList()
    }
}
