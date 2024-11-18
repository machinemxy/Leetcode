// https://leetcode.com/problems/defuse-the-bomb/description/

class Solution {
    fun decrypt(code: IntArray, k: Int): IntArray {
        val n = code.size
        val result = IntArray(n)
        if (k == 0) {
            return result
        } else if (k > 0) {
            for (i in 0 ..< n) {
                var sum = 0
                for (dj in 1 .. k) {
                    val j = (i + dj) % n
                    sum += code[j]
                }
                result[i] = sum
            }
            return result
        } else {
            for (i in 0 ..< n) {
                var sum = 0
                for (dj in -1 downTo k) {
                    val j = (i + dj + n) % n
                    sum += code[j]
                }
                result[i] = sum
            }
            return result
        }
    }
}
