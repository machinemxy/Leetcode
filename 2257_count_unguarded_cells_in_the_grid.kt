// https://leetcode.com/problems/count-unguarded-cells-in-the-grid/description/

class Solution {
    fun countUnguarded(m: Int, n: Int, guards: Array<IntArray>, walls: Array<IntArray>): Int {
        val matrix = Array(m) { CharArray(n) { ' ' } }
        for (wall in walls) {
            matrix[wall[0]][wall[1]] = 'w'
        }
        for (guard in guards) {
            matrix[guard[0]][guard[1]] = 'w'
        }
        for (guard in guards) {
            var y = guard[0] - 1
            while (y >= 0 && matrix[y][guard[1]] != 'w') {
                matrix[y][guard[1]] = 'g'
                y--
            }
            y = guard[0] + 1
            while (y < m && matrix[y][guard[1]] != 'w') {
                matrix[y][guard[1]] = 'g'
                y++
            }
            var x = guard[1] - 1
            while (x >= 0 && matrix[guard[0]][x] != 'w') {
                matrix[guard[0]][x] = 'g'
                x--
            }
            x = guard[1] + 1
            while (x < n && matrix[guard[0]][x] != 'w') {
                matrix[guard[0]][x] = 'g'
                x++
            }
        }
        var result = 0
        for (y in 0 ..< m) {
            for (x in 0 ..< n) {
                if (matrix[y][x] == ' ') {
                    result++
                }
            }
        }
        return result
    }
}
