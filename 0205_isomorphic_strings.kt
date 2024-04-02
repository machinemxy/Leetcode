// https://leetcode.com/problems/isomorphic-strings/description/

class Solution {
    fun isIsomorphic(s: String, t: String): Boolean {
        val stMap = mutableMapOf<Char, Char>()
        val tsMap = mutableMapOf<Char, Char>()
        for (i in s.indices) {
            val si = s[i]
            val ti = t[i]
            if (stMap[si] == null) {
                if (tsMap[ti] == null) {
                    stMap[si] = ti
                    tsMap[ti] = si
                } else {
                    return false
                }
            } else {
                if (tsMap[ti] == null) {
                    return false
                } else if (stMap[si] == ti && tsMap[ti] == si) {
                    continue
                } else {
                    return false
                }
            }
        }
        return true
    }
}
