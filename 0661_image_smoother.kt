// https://leetcode.com/problems/image-smoother/description/

class Solution {
    fun imageSmoother(img: Array<IntArray>): Array<IntArray> {
        val rowCount = img.size
        val colCount = img[0].size
        val result = Array(rowCount) { IntArray(colCount) }
        for (y in 0 until rowCount) {
            for (x in 0 until  colCount) {
                var sum = 0
                var count = 0
                for (dy in -1 .. 1) {
                    val newY = y + dy
                    if (newY < 0 || newY >= rowCount) {
                        continue
                    }
                    for (dx in -1 .. 1) {
                        val newX = x + dx
                        if (newX < 0 || newX >= colCount) {
                            continue
                        }
                        sum += img[newY][newX]
                        count++
                    }
                }
                result[y][x] = sum / count
            }
        }
        return result
    }
}
