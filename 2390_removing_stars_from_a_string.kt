// https://leetcode.com/problems/removing-stars-from-a-string/description/

import java.lang.StringBuilder

class Solution {
    fun removeStars(s: String): String {
        val queue = ArrayDeque<Char>()
        for (c in s) {
            if (c == '*') {
                queue.removeLast()
            } else {
                queue.add(c)
            }
        }
        val builder = StringBuilder()
        while (queue.isNotEmpty()) {
            builder.append(queue.removeFirst())
        }
        return builder.toString()
    }
}
