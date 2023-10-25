// https://leetcode.com/problems/k-th-symbol-in-grammar/

class Solution {
    fun kthGrammar(n: Int, k: Int): Int {
        val realK = k - 1
        return solve(n, realK)
    }

    private fun solve(n: Int, k: Int): Int {
        if (n == 0) {
            return 0
        }
        val prevResult = solve(n - 1, k / 2)
        val mod = k % 2
        if (prevResult == 0) {
            if (mod == 0) {
                return 0
            } else {
                return 1
            }
        } else {
            if (mod == 0) {
                return 1
            } else {
                return 0
            }
        }
    }
}
