// https://leetcode.com/problems/maximum-number-of-vowels-in-a-substring-of-given-length/description/

import kotlin.math.max

class Solution {
    fun maxVowels(s: String, k: Int): Int {
        val vowels = setOf('a', 'e', 'i', 'o', 'u')
        var sum = 0
        for (i in 0 until k) {
            if (vowels.contains(s[i])) {
                sum++
            }
        }
        var maxSum = sum
        var i = k
        while (i < s.length) {
            if (vowels.contains(s[i])) {
                sum++
            }
            if (vowels.contains(s[i - k])) {
                sum--
            }
            maxSum = max(maxSum, sum)
            i++
        }
        return maxSum
    }
}
