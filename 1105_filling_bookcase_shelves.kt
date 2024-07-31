// https://leetcode.com/problems/filling-bookcase-shelves/description/

import kotlin.math.max
import kotlin.math.min

class Solution {
    fun minHeightShelves(books: Array<IntArray>, shelfWidth: Int): Int {
        val dpMap = mutableMapOf<Int, Int>()
        dpMap[-1] = 0
        for (i in books.indices) {
            var currentWidth = 0
            var maxHeight = 0
            var minResult = Int.MAX_VALUE
            var j = 0
            while (true) {
                val currentIndex = i - j
                if (currentIndex < 0) {
                    break
                }
                currentWidth += books[currentIndex][0]
                if (currentWidth > shelfWidth) {
                    break
                }
                maxHeight = max(maxHeight, books[currentIndex][1])
                val currentResult = dpMap.getValue(currentIndex - 1) + maxHeight
                minResult = min(minResult, currentResult)
                j++
            }
            dpMap[i] = minResult
        }
        return dpMap.getValue(books.size - 1)
    }
}
