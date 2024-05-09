// https://leetcode.com/problems/maximize-happiness-of-selected-children/description/

class Solution {
    fun maximumHappinessSum(happiness: IntArray, k: Int): Long {
        happiness.sortDescending()
        var result = 0L
        for (i in 0 until k) {
            val happy = happiness[i] - i
            if (happy <= 0) {
                break
            }
            result += happy
        }
        return result
    }
}
