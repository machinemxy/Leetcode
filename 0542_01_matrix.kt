// https://leetcode.com/problems/01-matrix/description/

class Solution {
    fun updateMatrix(mat: Array<IntArray>): Array<IntArray> {
        val rowCount = mat.size
        val colCount = mat[0].size
        val result = Array(rowCount) { IntArray(colCount) { -1 } }
        var rest = rowCount * colCount
        for (y in 0 until rowCount) {
            for (x in 0 until colCount) {
                if (mat[y][x] == 0) {
                    result[y][x] = 0
                    rest--
                }
            }
        }
        var currentDistance = 0
        while (rest > 0) {
            for (y in 0 until rowCount) {
                for (x in 0 until colCount) {
                    if (result[y][x] == currentDistance) {
                        if (y - 1 >= 0 && result[y - 1][x] == -1) {
                            result[y - 1][x] = currentDistance + 1
                            rest--
                        }
                        if (y + 1 < rowCount && result[y + 1][x] == -1) {
                            result[y + 1][x] = currentDistance + 1
                            rest--
                        }
                        if (x - 1 >= 0 && result[y][x - 1] == -1) {
                            result[y][x - 1] = currentDistance + 1
                            rest--
                        }
                        if (x + 1 < colCount && result[y][x + 1] == -1) {
                            result[y][x + 1] = currentDistance + 1
                            rest--
                        }
                    }
                }
            }
            currentDistance++
        }
        return result
    }
}
