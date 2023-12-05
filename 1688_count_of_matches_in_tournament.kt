// https://leetcode.com/problems/count-of-matches-in-tournament/description/

class Solution {
    fun numberOfMatches(n: Int): Int {
        if (n == 1) {
            return 0
        } else if (n % 2 == 0) {
            val matches = n / 2
            return matches + numberOfMatches(n / 2)
        } else {
            val matches = n / 2
            return matches + numberOfMatches(n / 2 + 1)
        }
    }
}
