// https://leetcode.com/problems/find-the-city-with-the-smallest-number-of-neighbors-at-a-threshold-distance/description/?envType=daily-question&envId=2024-07-26

class Solution {
    fun findTheCity(n: Int, edges: Array<IntArray>, distanceThreshold: Int): Int {
        val paths = Array(n) { IntArray(n) { Int.MAX_VALUE } }
        for (edge in edges) {
            paths[edge[0]][edge[1]] = edge[2]
            paths[edge[1]][edge[0]] = edge[2]
        }
        for (k in 0 until n) {
            for (i in 0 until n - 1) {
                if (paths[i][k] == Int.MAX_VALUE) {
                    continue
                }
                for (j in i + 1 until n) {
                    if (paths[j][k] == Int.MAX_VALUE) {
                        continue
                    }
                    val newPath = paths[i][k] + paths[j][k]
                    if (newPath < paths[i][j]) {
                        paths[i][j] = newPath
                        paths[j][i] = newPath
                    }
                }
            }
        }
        var minCityCount = Int.MAX_VALUE
        var minCityIndex = -1
        for (i in n - 1 downTo 0) {
            var cityCount = 0
            for (j in 0 until n) {
                if (paths[i][j] <= distanceThreshold) {
                    cityCount++
                }
            }
            if (cityCount < minCityCount) {
                minCityCount = cityCount
                minCityIndex = i
            }
        }
        return minCityIndex
    }
}
