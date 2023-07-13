// https://leetcode.com/problems/course-schedule/description/

class Solution {
    fun canFinish(numCourses: Int, prerequisites: Array<IntArray>): Boolean {
        val fromToGraph = Array(numCourses) { mutableSetOf<Int>() }
        val toFromGraph = Array(numCourses) { mutableSetOf<Int>() }
        for (p in prerequisites) {
            fromToGraph[p[0]].add(p[1])
            toFromGraph[p[1]].add(p[0])
        }
        val deque = ArrayDeque<Int>()
        for (i in toFromGraph.indices) {
            if (toFromGraph[i].isEmpty()) {
                deque.add(i)
            }
        }
        var removedCourses = 0
        while (deque.isNotEmpty()) {
            val course = deque.removeFirst()
            for (nextCourse in fromToGraph[course]) {
                toFromGraph[nextCourse].remove(course)
                if (toFromGraph[nextCourse].isEmpty()) {
                    deque.add(nextCourse)
                }
            }
            fromToGraph[course] = mutableSetOf()
            removedCourses++
        }
        return removedCourses == numCourses
    }
}
