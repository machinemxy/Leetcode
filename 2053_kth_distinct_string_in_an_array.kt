// https://leetcode.com/problems/kth-distinct-string-in-an-array/description/

class Solution {
    fun kthDistinct(arr: Array<String>, k: Int): String {
        val distinctSet = mutableSetOf<String>()
        val duplicateSet = mutableSetOf<String>()
        for (str in arr) {
            if (distinctSet.contains(str)) {
                distinctSet.remove(str)
                duplicateSet.add(str)
            } else if (!duplicateSet.contains(str)) {
                distinctSet.add(str)
            }
        }
        var count = 1
        for (str in arr) {
            if (distinctSet.contains(str)) {
                if (count == k) {
                    return str
                } else {
                    count++
                }
            }
        }
        return ""
    }
}
