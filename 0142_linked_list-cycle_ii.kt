// https://leetcode.com/problems/linked-list-cycle-ii/description/

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
    fun detectCycle(head: ListNode?): ListNode? {
        var slow = head
        var fast = head
        while (true) {
            fast = fast?.next?.next
            if (fast == null) { return null }
            slow = slow?.next
            if (slow === fast) {
                break
            }
        }
        slow = head
        while (slow !== fast) {
            slow = slow?.next
            fast = fast?.next
        }
        return slow
    }
}
