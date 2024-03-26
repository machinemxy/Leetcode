// https://leetcode.com/problems/dota2-senate/description/

class Solution {
    fun predictPartyVictory(senate: String): String {
        var rCount = 0
        var dCount = 0
        for (c in senate) {
            if (c == 'R') {
                rCount++
            } else {
                dCount++
            }
        }
        val list = senate.toMutableList()
        val n = list.size
        var rPendingRight = 0
        var dPendingRight = 0
        var i = 0
        while (rCount > 0 && dCount > 0) {
            val c = list[i]
            if (c == 'R') {
                if (dPendingRight > 0) {
                    dPendingRight--
                    list[i] = ' '
                    rCount--
                } else {
                    rPendingRight++
                }
            } else if (c == 'D') {
                if (rPendingRight > 0) {
                    rPendingRight--
                    list[i] = ' '
                    dCount--
                } else {
                    dPendingRight++
                }
            }
            i++
            if (i >= n) {
                i = 0
            }
        }
        if (rCount == 0) {
            return "Dire"
        } else {
            return "Radiant"
        }
    }
}
