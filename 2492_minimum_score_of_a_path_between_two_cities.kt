// https://leetcode.com/problems/minimum-score-of-a-path-between-two-cities/description/

import kotlin.math.min

class Solution {
    fun minScore(n: Int, roads: Array<IntArray>): Int {
        val map = mutableMapOf<Int, MutableSet<CityAndScore>>()
        for (road in roads) {
            map[road[0]]?.add(CityAndScore(road[1], road[2])) ?: run {
                map[road[0]] = mutableSetOf(CityAndScore(road[1], road[2]))
            }
            map[road[1]]?.add(CityAndScore(road[0], road[2])) ?: run {
                map[road[1]] = mutableSetOf(CityAndScore(road[0], road[2]))
            }
        }
        var result = Int.MAX_VALUE
        val queue = ArrayDeque<Int>()
        queue.add(1)
        val visited = Array(n + 1) { false }
        visited[1] = true
        while (queue.isNotEmpty()) {
            val city = queue.removeFirst()
            map[city]?.let {
                for (cityAndScore in it) {
                    result = min(result, cityAndScore.score)
                    val nextCity = cityAndScore.city
                    if (!visited[nextCity]) {
                        queue.add(nextCity)
                        visited[nextCity] = true
                    }
                }
            }
        }
        return result
    }
}

data class CityAndScore(
    val city: Int,
    val score: Int
)
