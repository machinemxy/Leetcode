// https://leetcode.com/problems/word-break/description/

class Solution {
    fun wordBreak(s: String, wordDict: List<String>): Boolean {
        val dp = BooleanArray(s.length + 1)
        dp[0] = true
        for (i in 1 .. s.length) {
            var canBreak = false
            val subS = s.subSequence(0, i)
            for (word in wordDict) {
                val wordLength = word.length
                if (wordLength > i) { continue }
                if (!dp[i - wordLength]) { continue }
                if (subS.endsWith(word)) {
                    canBreak = true
                    break
                }
            }
            dp[i] = canBreak
        }
        return dp[s.length]
    }
}
