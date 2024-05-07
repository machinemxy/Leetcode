// https://leetcode.com/problems/double-a-number-represented-as-a-linked-list/description/

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
    fun doubleIt(head: ListNode?): ListNode? {
        if (checkCarryOver(head!!)) {
            val newNode = ListNode(1)
            newNode.next = head
            return newNode
        } else {
            return head
        }
    }

    private fun checkCarryOver(node: ListNode): Boolean {
        var v = node.`val` * 2
        node.next?.let {
            if (checkCarryOver(it)) {
                v += 1
            }
            if (v >= 10) {
                node.`val` = v - 10
                return true
            } else {
                node.`val` = v
                return false
            }
        } ?: run {
           if (v >= 10) {
               node.`val` = v - 10
               return true
           } else {
               node.`val` = v
               return false
           }
        }
    }
}
