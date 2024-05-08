// https://leetcode.com/problems/relative-ranks/description/

class Solution {
    fun findRelativeRanks(score: IntArray): Array<String> {
        val sortedScore = score.sortedDescending()
        val map = mutableMapOf<Int, String>()
        for (i in sortedScore.indices) {
            val value = sortedScore[i]
            if (i > 2) {
                map[value] = (i + 1).toString()
            } else if (i == 0) {
                map[value] = "Gold Medal"
            } else if (i == 1) {
                map[value] = "Silver Medal"
            } else {
                map[value] = "Bronze Medal"
            }
        }
        val result =  score.map { map[it]!! }
        return result.toTypedArray()
    }
}
