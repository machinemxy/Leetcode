// https://leetcode.com/problems/merge-nodes-in-between-zeros/description/

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
    fun mergeNodes(head: ListNode?): ListNode? {
        var valueNode = head!!
        var node = head!!.next
        while (node != null) {
            if (node.`val` == 0) {
                if (node.next != null) {
                    valueNode.next = node
                    valueNode = node
                } else {
                    valueNode.next = null
                }
            } else {
                valueNode.`val` += node.`val`
            }
            node = node.next
        }
        return head
    }
}
