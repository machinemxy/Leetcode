// https://leetcode.com/problems/can-place-flowers/description/

class Solution {
    fun canPlaceFlowers(flowerbed: IntArray, n: Int): Boolean {
        if (n == 0) { return true }
        var i = 0
        var restN = n
        while (i < flowerbed.size) {
            val plot = flowerbed[i]
            if (plot == 1) {
                i += 2
            } else if (i == flowerbed.size - 1 || flowerbed[i + 1] == 0) {
                restN--
                if (restN == 0) {
                    return true
                }
                i += 2
            } else {
                i += 3
            }
        }
        return false
    }
}
