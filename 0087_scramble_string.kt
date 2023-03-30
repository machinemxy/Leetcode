// https://leetcode.com/problems/scramble-string/description/

class Solution {
    val map = mutableMapOf<S1S2, Boolean>()

    fun isScramble(s1: String, s2: String): Boolean {
        if (s1.length != s2.length) {
            return false
        }
        return isConvertable(s1, s2)
    }

    private fun isConvertable(s1: String, s2: String): Boolean {
        if (s1 == s2) {
            return true
        }

        map[S1S2(s1, s2)]?.let {
            return it
        }

        var result = false
        val n = s1.length
        for (i in 1 until s1.length) {
            val convertableIfNotSwap = isConvertable(s1.substring(0, i), s2.substring(0, i)) && isConvertable(s1.substring(i), s2.substring(i))
            if (convertableIfNotSwap) {
                result = true
                break
            }
            val convertableIfSwap = isConvertable(s1.substring(0, i), s2.substring(n - i)) && isConvertable(s1.substring(i), s2.substring(0, n - i))
            if (convertableIfSwap) {
                result = true
                break
            }
        }
        map[S1S2(s1, s2)] = result
        return result
    }
}

data class S1S2(
    val s1: String,
    val s2: String
)
