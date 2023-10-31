// https://leetcode.com/problems/find-the-original-array-of-prefix-xor/description/

class Solution {
    fun findArray(pref: IntArray): IntArray {
        val n = pref.size
        for (i in n - 1 downTo 1) {
            pref[i] = pref[i - 1] xor pref[i]
        }
        return pref
    }
}
