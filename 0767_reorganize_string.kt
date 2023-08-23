// https://leetcode.com/problems/reorganize-string/description/

import java.util.PriorityQueue

class Solution {
    fun reorganizeString(s: String): String {
        val n = s.length
        val array = IntArray(26)
        for (c in s) {
            array[c - 'a'] += 1
        }
        val queue = PriorityQueue<CharAndCount>(compareByDescending { it.count })
        array.forEachIndexed { i, count ->
            if (count > 0) {
                queue.add(CharAndCount('a' + i, count))
            }
        }
        val first = queue.peek()
        if (n % 2 == 0) {
            if (first.count > n / 2) {
                return ""
            }
        } else {
            if (first.count > n / 2 + 1) {
                return ""
            }
        }
        var result = ""
        var prev = '-'
        while (queue.isNotEmpty()) {
            val first = queue.poll()
            if (first.char == prev) {
                val second = queue.poll()
                second.count--
                result += second.char
                prev = second.char
                queue.add(first)
                if (second.count > 0) {
                    queue.add(second)
                }
            } else {
                first.count--
                result += first.char
                prev = first.char
                if (first.count > 0) {
                    queue.add(first)
                }
            }
        }
        return result
    }
}

data class CharAndCount(
    val char: Char,
    var count: Int
)
