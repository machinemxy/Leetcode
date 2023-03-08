// https://leetcode.com/problems/koko-eating-bananas/description/

import kotlin.math.max

class Solution {
    fun minEatingSpeed(piles: IntArray, h: Int): Int {
        var sumPiles: Long = 0
        var maxPile = Int.MIN_VALUE
        for (pile in piles) {
            sumPiles += pile
            maxPile = max(pile, maxPile)
        }
        var l = ((sumPiles + h - 1) / h).toInt()
        var r = maxPile
        var result = 0
        while (l <= r) {
            val mid = (l + r) / 2
            if (canEatWithSpeed(mid, piles, h)) {
                result = mid
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        return result
    }

    private fun canEatWithSpeed(k: Int, piles: IntArray, h: Int): Boolean {
        var currentH = 0
        for (pile in piles) {
            currentH += ((pile + k - 1) / k)
            if (currentH > h) {
                return false
            }
        }
        return true
    }
}
