// https://leetcode.com/problems/minimum-speed-to-arrive-on-time/description/

import kotlin.math.ceil
import kotlin.math.max

class Solution {
    fun minSpeedOnTime(dist: IntArray, hour: Double): Int {
        val n = dist.size
        if ((n - 1).toDouble() >= hour) {
            return -1
        }
        var maxSpeed = 0
        for (i in 0 until n - 1) {
            maxSpeed = max(maxSpeed, dist[i])
        }
        val lastMaxSpeed = ceil(dist[n - 1].toDouble() / (hour - n + 1)).toInt()
        maxSpeed = max(maxSpeed, lastMaxSpeed)
        var l = 1
        var r = maxSpeed
        var result = -1
        while (l <= r) {
            val midSpeed = (l + r) / 2
            if (canAchieve(midSpeed, dist, hour)) {
                result = midSpeed
                r = midSpeed - 1
            } else {
                l = midSpeed + 1
            }
        }
        return result
    }

    private fun canAchieve(speed: Int, dist: IntArray, hour: Double): Boolean {
        val n = dist.size
        var spentHour = 0.0
        for (i in 0 until n - 1) {
            spentHour += ceil(dist[i].toDouble() / speed.toDouble())
            if (spentHour > hour) {
                return false
            }
        }
        spentHour += dist[n - 1].toDouble() / speed.toDouble()
        return spentHour <= hour
    }
}
