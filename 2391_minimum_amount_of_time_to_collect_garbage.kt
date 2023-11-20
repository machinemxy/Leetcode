// https://leetcode.com/problems/minimum-amount-of-time-to-collect-garbage/description/

class Solution {
    fun garbageCollection(garbage: Array<String>, travel: IntArray): Int {
        var mTruck = 0
        var pTruck = 0
        var gTruck = 0
        var result = 0
        for (i in garbage.indices) {
            val ga = garbage[i]
            var m = 0
            var p = 0
            var g = 0
            for (c in ga) {
                if (c == 'M') {
                    m++
                } else if (c == 'P') {
                    p++
                } else {
                    g++
                }
            }
            if (m > 0) {
                result += m
                for (j in mTruck until i) {
                    result += travel[j]
                }
                mTruck = i
            }
            if (p > 0) {
                result += p
                for (j in pTruck until i) {
                    result += travel[j]
                }
                pTruck = i
            }
            if (g > 0) {
                result += g
                for (j in gTruck until i) {
                    result += travel[j]
                }
                gTruck = i
            }
        }
        return result
    }
}
