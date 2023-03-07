// https://leetcode.com/problems/minimum-time-to-complete-trips/description/

import java.lang.Long.max
import java.lang.Long.min

class Solution {
    fun minimumTime(time: IntArray, totalTrips: Int): Long {
        val buses = time.map { it.toLong() }
        val requiredTrips = totalTrips.toLong()
        var minTime = Long.MAX_VALUE
        var maxTime = Long.MIN_VALUE
        for (bus in buses) {
            minTime = min(bus, minTime)
            maxTime = max(bus, maxTime)
        }
        val busCount = time.size.toLong()
        val rounds = (totalTrips + busCount - 1) / busCount
        var l = minTime * rounds
        var r = maxTime * rounds
        var result = Long.MAX_VALUE
        while (l <= r) {
            val mid = (l + r) / 2
            if (isPossibleWithTime(mid, buses, requiredTrips)) {
                result = mid
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        return result
    }

    private fun isPossibleWithTime(time: Long, buses: List<Long>, requiredTrips: Long): Boolean {
        var trips: Long = 0
        for (bus in buses) {
            trips += time / bus
            if (trips >= requiredTrips) {
                return true
            }
        }
        return false
    }
}
