// https://leetcode.com/problems/matrix-diagonal-sum/description/

class Solution {
    fun diagonalSum(mat: Array<IntArray>): Int {
        var sum = 0
        val n = mat.size
        for (i in mat.indices) {
            sum += (mat[i][i] + mat[i][n - 1 - i])
        }
        if (n % 2 == 1) {
            sum -= mat[n / 2][n / 2]
        }
        return sum
    }
}
