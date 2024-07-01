// https://leetcode.com/problems/three-consecutive-odds/description/

class Solution {
    fun threeConsecutiveOdds(arr: IntArray): Boolean {
        var consecutiveCount = 0
        for (i in arr) {
            if (i % 2 == 1) {
                consecutiveCount++
                if (consecutiveCount == 3) {
                    return true
                }
            } else {
                consecutiveCount = 0
            }
        }
        return false
    }
}
