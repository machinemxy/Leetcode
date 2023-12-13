// https://leetcode.com/problems/special-positions-in-a-binary-matrix/description/

class Solution {
    fun numSpecial(mat: Array<IntArray>): Int {
        var result = 0

        val rowCount = mat.size
        val colCount = mat[0].size

        outer@for (y in 0 until rowCount) {
            var oneX: Int? = null
            
            for (x in 0 until colCount) {
                if (mat[y][x] == 1) {
                   if (oneX == null) {
                       oneX = x
                   } else {
                       continue@outer
                   }
                }
            }
            
            oneX?.let { 
                var count = 0
                for (i in 0 until rowCount) {
                    if (mat[i][oneX] == 1) {
                        count++
                        if (count > 1) {
                            break
                        }
                    }
                }
                if (count == 1) {
                    result++
                }
            }
        }

        return result
    }
}
