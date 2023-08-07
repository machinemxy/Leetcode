// https://leetcode.com/problems/search-a-2d-matrix/description/

class Solution {
    fun searchMatrix(matrix: Array<IntArray>, target: Int): Boolean {
        val colSize = matrix[0].size
        var l = 0
        var r = matrix.size - 1
        while (l <= r) {
            val mid = (l + r) / 2
            if (target < matrix[mid][0]) {
                r = mid - 1
            } else if (target > matrix[mid][colSize - 1]) {
                l = mid + 1
            } else {
                return searchRow(matrix[mid], target)
            }
        }
        return false
    }

    private fun searchRow(row: IntArray, target: Int): Boolean {
        var l = 0
        var r = row.size - 1
        while (l <= r) {
            val mid = (l + r) / 2
            if (target == row[mid]) {
                return true
            } else if (target < row[mid]) {
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        return false
    }
}
