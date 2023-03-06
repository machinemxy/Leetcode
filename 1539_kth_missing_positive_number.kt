// https://leetcode.com/problems/kth-missing-positive-number/description/

class Solution {
    fun findKthPositive(arr: IntArray, k: Int): Int {
        val set = arr.toSet()
        var i = 1
        var n = 1
        while (true) {
            if (set.contains(n)) { 
                n++
                continue 
            }
            if (i == k ) {
                return n
            }
            i++
            n++
        }
    }
}
