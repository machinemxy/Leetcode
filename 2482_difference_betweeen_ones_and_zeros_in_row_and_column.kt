// https://leetcode.com/problems/difference-between-ones-and-zeros-in-row-and-column/description/

class Solution {
    fun onesMinusZeros(grid: Array<IntArray>): Array<IntArray> {
        val rowCount = grid.size
        val colCount = grid[0].size
        val oneInRows = IntArray(rowCount)
        val zeroInRows = IntArray(rowCount)
        val oneInCols = IntArray(colCount)
        val zeroInCols = IntArray(colCount)
        for (y in 0 until rowCount) {
            for (x in 0 until colCount) {
                if (grid[y][x] == 0) {
                    zeroInCols[x]++
                    zeroInRows[y]++
                } else {
                    oneInCols[x]++
                    oneInRows[y]++
                }
            }
        }
        for (y in 0 until rowCount) {
            for (x in 0 until colCount) {
                grid[y][x] = oneInRows[y] + oneInCols[x] - zeroInRows[y] - zeroInCols[x]
            }
        }
        return grid
    }
}
