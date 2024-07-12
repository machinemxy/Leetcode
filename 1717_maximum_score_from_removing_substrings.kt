// https://leetcode.com/problems/maximum-score-from-removing-substrings/description/

class Solution {
    fun maximumGain(s: String, x: Int, y: Int): Int {
        val a = s.toCharArray()
        val deque = ArrayDeque<Int>()
        var count = 0
        var result = 0
        if (x > y) {
            for (i in a.indices) {
                if (a[i] == 'a') {
                    deque.add(i)
                } else if (a[i] == 'b' && deque.isNotEmpty()) {
                    val j = deque.removeLast()
                    a[j] = '-'
                    a[i] = '-'
                    result += x
                } else {
                    deque.clear()
                }
            }
            
            for (i in a.indices) {
                if (a[i] == '-') {
                    continue
                } else if (a[i] == 'b') {
                    count++
                } else if (a[i] == 'a' && count > 0) {
                    count--
                    result += y
                } else {
                    count = 0
                }
            }
        } else {
            for (i in a.indices) {
                if (a[i] == 'b') {
                    deque.add(i)
                } else if (a[i] == 'a' && deque.isNotEmpty()) {
                    val j = deque.removeLast()
                    a[j] = '-'
                    a[i] = '-'
                    result += y
                } else {
                    deque.clear()
                }
            }
            
            for (i in a.indices) {
                if (a[i] == '-') {
                    continue
                } else if (a[i] == 'a') {
                    count++
                } else if (a[i] == 'b' && count > 0) {
                    count--
                    result += x
                } else {
                    count = 0
                }
            }
        }
        return result
    }
}
