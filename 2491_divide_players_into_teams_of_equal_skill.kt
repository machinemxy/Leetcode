// https://leetcode.com/problems/divide-players-into-teams-of-equal-skill/description/

class Solution {
    fun dividePlayers(skill: IntArray): Long {
        skill.sort()
        val deque = ArrayDeque<Int>()
        skill.forEach {
            deque.add(it)
        }
        var pairSkill: Int? = null
        var result = 0L
        while (deque.isNotEmpty()) {
            val first = deque.removeFirst()
            val last= deque.removeLast()
            if (pairSkill == null) {
                pairSkill = first + last
            } else if (pairSkill != first + last) {
                return -1
            }
            result += first * last
        }
        return result
    }
}
