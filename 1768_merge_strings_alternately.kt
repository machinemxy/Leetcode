// https://leetcode.com/problems/merge-strings-alternately/description/

import java.lang.StringBuilder

class Solution {
    fun mergeAlternately(word1: String, word2: String): String {
        val sb = StringBuilder()
        val n1 = word1.length
        val n2 = word2.length
        var i1 = 0
        var i2 = 0
        while (true) {
            if (i1 < n1) {
                sb.append(word1[i1])
                i1++
            } else {
                sb.append(word2.substring(i2))
                break
            }
            
            if (i2 < n2) {
                sb.append(word2[i2])
                i2++
            } else {
                sb.append(word1.substring(i1))
                break
            }
        }
        return sb.toString()
    }
}
