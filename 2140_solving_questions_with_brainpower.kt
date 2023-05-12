// https://leetcode.com/problems/solving-questions-with-brainpower/description/

import java.lang.Long.max

class Solution {
    fun mostPoints(questions: Array<IntArray>): Long {
        val n = questions.size
        val dp = LongArray(n)
        for (i in n - 1 downTo 0) {
            val skipPoint = getPoint(i + 1, dp)
            val doPoint = getPoint(i + 1 + questions[i][1], dp) + questions[i][0].toLong()
            dp[i] = max(skipPoint, doPoint)
        }
        return dp[0]
    }

    private fun getPoint(i: Int, dp: LongArray): Long {
        if (i >= dp.size) {
            return 0
        } else {
            return dp[i]
        }
    }
}
