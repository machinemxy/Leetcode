// https://leetcode.com/problems/reverse-linked-list/description/

/**
 * Example:
 * var li = ListNode(5)
 * var v = li.`val`
 * Definition for singly-linked list.
 * class ListNode(var `val`: Int) {
 *     var next: ListNode? = null
 * }
 */
class Solution {
    fun reverseList(head: ListNode?): ListNode? {
        if (head == null) { return null }
        var prev: ListNode? = null
        var current = head!!
        var next = current.next
        while (true) {
            current.next = prev
            if (next == null) {
                break
            }
            prev = current
            current = next
            next = next.next
        }
        return current
    }
}
