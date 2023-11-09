// https://leetcode.com/problems/count-number-of-homogenous-substrings/description/

class Solution {
    fun countHomogenous(s: String): Int {
        var count = 0L
        var previous = '-'
        var previousCount = 0
        for (c in s) {
            if (c == previous) {
                previousCount++
            } else {
                previous = c
                previousCount = 1
            }
            count += previousCount.toLong()
        }
        return (count % 1000000007L).toInt()
    }
}
