// https://leetcode.com/problems/successful-pairs-of-spells-and-potions/description/

class Solution {
    fun successfulPairs(spells: IntArray, potions: IntArray, success: Long): IntArray {
        val result = IntArray(spells.size) { 0 }
        potions.sort()
        spells.forEachIndexed { spellIndex, spell ->
            var l = 0
            var r = potions.size - 1
            var minIndex = potions.size
            while (l <= r) {
                val mid = (l + r) / 2
                val midVal = potions[mid]
                if (spell.toLong() * midVal.toLong() >= success) {
                    minIndex = mid
                    r = mid - 1
                } else {
                    l = mid + 1
                }
            }
            result[spellIndex] = potions.size - minIndex
        }
        return result
    }
}
