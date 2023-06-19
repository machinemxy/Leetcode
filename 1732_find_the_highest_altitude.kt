// https://leetcode.com/problems/find-the-highest-altitude/description/

import kotlin.math.max

class Solution {
    fun largestAltitude(gain: IntArray): Int {
        var current = 0
        var maxAltitude = 0
        for (altitude in gain) {
            current += altitude
            maxAltitude = max(current, maxAltitude)
        }
        return maxAltitude
    }
}
