// https://leetcode.com/problems/assign-cookies/description/

class Solution {
    fun findContentChildren(g: IntArray, s: IntArray): Int {
        g.sortDescending()
        s.sortDescending()
        var gi = 0
        var si = 0
        val gn = g.size
        val sn = s.size
        var result = 0
        while (gi < gn && si < sn) {
            if (s[si] >= g[gi]) {
                gi++
                si++
                result++
            } else {
                gi++
            }
        }
        return result
    }
}
