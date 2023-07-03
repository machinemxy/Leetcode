// https://leetcode.com/problems/buddy-strings/description/

class Solution {
    fun buddyStrings(s: String, goal: String): Boolean {
        if (s == goal) {
            return hasDuplicatedChar(s)
        }

        val n = s.length
        if (n != goal.length) { return false }
        var swapped = false
        var temp: Pair<Char, Char>? = null
        for (i in 0 until n) {
            val c1 = s[i]
            val c2 = goal[i]
            if (c1 == c2) { continue }
            if (swapped) {
                return false
            }
            temp?.let { 
                if (c2 == it.first && c1 == it.second) {
                    swapped = true
                } else {
                    return false
                }
            } ?: run {
                temp = Pair(c1, c2)
            }
        }
        return swapped
    }

    private fun hasDuplicatedChar(s: String): Boolean {
        val set = mutableSetOf<Char>()
        for (c in s) {
            if (set.contains(c)) {
                return true
            } else {
                set.add(c)
            }
        }
        return false
    }
}
