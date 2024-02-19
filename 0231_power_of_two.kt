// https://leetcode.com/problems/power-of-two/description/

class Solution {
    fun isPowerOfTwo(n: Int): Boolean {
        var t = 1L
        while (t < n) {
            t *= 2
        }
        return t == n.toLong()
    }
}
