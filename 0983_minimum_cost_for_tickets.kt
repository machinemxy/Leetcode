// https://leetcode.com/problems/minimum-cost-for-tickets/description/

import java.lang.Integer.min

class Solution {
    fun mincostTickets(days: IntArray, costs: IntArray): Int {
        val minDay = days[0]
        val maxDay = days[days.size - 1]
        val calendar = Array(maxDay + 1) { 0 }
        val daysSet = days.toSet()
        for (i in minDay..maxDay) {
            if (daysSet.contains(i)) {
                val plan1 = calendar[i - 1] + costs[0]
                val sevenDaysBefore = i - 7
                val plan2 = if (sevenDaysBefore < 0) {
                    costs[1]
                } else {
                    calendar[sevenDaysBefore] + costs[1]
                }
                val thirtyDaysBefore = i - 30
                val plan3 = if (thirtyDaysBefore < 0) {
                    costs[2]
                } else {
                    calendar[thirtyDaysBefore] + costs[2]
                }
                calendar[i] = min(plan1, min(plan2, plan3))
            } else {
                calendar[i] = calendar[i - 1]
            }
        }
        return calendar[maxDay]
    }
}
