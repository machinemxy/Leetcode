// https://leetcode.com/problems/ipo/description/

class Solution {
    fun findMaximizedCapital(k: Int, w: Int, profits: IntArray, capital: IntArray): Int {
        val projects = profits.indices.map { Project(profits[it], capital[it]) }
            .sortedBy { it.capital }
        val queue = PriorityQueue<Project>(compareByDescending { it.profit })
        var result = w
        var pi = 0
        for (i in 1..k) {
            while(pi < projects.size && projects[pi].capital <= result) {
                queue.add(projects[pi])
                pi++
            }
            val project: Project? = queue.poll()
            project?.let { result += it.profit }
        }
        return result
    }
}

data class Project(
    val profit: Int,
    val capital: Int
)
