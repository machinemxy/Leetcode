// https://leetcode.com/problems/maximum-twin-sum-of-a-linked-list/description/

/**
 * Example:
 * var li = ListNode(5)
 * var v = li.`val`
 * Definition for singly-linked list.
 * class ListNode(var `val`: Int) {
 *     var next: ListNode? = null
 * }
 */
import kotlin.math.max

class Solution {
    fun pairSum(head: ListNode?): Int {
        val deque = ArrayDeque<Int>()
        var node = head
        while (node != null) {
            deque.add(node.`val`)
            node = node.next
        }
        var result = Int.MIN_VALUE
        while (deque.isNotEmpty()) {
            val first = deque.removeFirst()
            val last = deque.removeLast()
            result = max(result, first + last)
        }
        return result
    }
}
