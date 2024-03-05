// https://leetcode.com/problems/minimum-length-of-string-after-deleting-similar-ends/description/

class Solution {
    fun minimumLength(s: String): Int {
        val list = s.toMutableList()
        while (list.size > 1 && list.first() == list.last()) {
            val c = list.removeFirst()
            while (list.isNotEmpty() && list.first() == c) {
                list.removeFirst()
            }
            while (list.isNotEmpty() && list.last() == c) {
                list.removeLast()
            }
        }
        return list.size
    }
}
