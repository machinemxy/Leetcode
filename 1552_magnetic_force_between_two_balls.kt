// https://leetcode.com/problems/magnetic-force-between-two-balls/description/

class Solution {
    fun maxDistance(position: IntArray, m: Int): Int {
        position.sort()
        var l = 1
        var r = (position.last() - position.first()) / (m - 1)
        while (l <= r) {
            val mid = (l + r) / 2
            if (isPossible(position, m, mid)) {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        return l - 1
    }

    private fun isPossible(position: IntArray, m: Int, force: Int): Boolean {
        var restM = m
        var prev: Int? = null
        for (p in position) {
            prev?.let {
                if (p - it >= force) {
                    restM--
                    prev = p
                    if (restM == 0) {
                        return true
                    }
                }
            } ?: run {
                restM--
                prev = p
            }
        }
        return false
    }
}
