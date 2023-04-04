// https://leetcode.com/problems/optimal-partition-of-string/description/

class Solution {
    fun partitionString(s: String): Int {
        var set = mutableSetOf<Char>()
        var result = 1
        for (c in s) {
            if (set.contains(c)) {
                set = mutableSetOf(c)
                result += 1
            } else {
                set.add(c)
            }
        }
        return result
    }
}
