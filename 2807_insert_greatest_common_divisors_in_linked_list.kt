// https://leetcode.com/problems/insert-greatest-common-divisors-in-linked-list/description/

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
    fun insertGreatestCommonDivisors(head: ListNode?): ListNode? {
        var node1 = head!!
        var node2 = node1.next
        while (node2 != null) {
            val smaller = min(node1.`val`, node2.`val`)
            for (i in smaller downTo 1) {
                if (node1.`val` % i == 0 && node2.`val` % i == 0) {
                    val newNode = ListNode(i)
                    newNode.next = node2
                    node1.next = newNode
                    break
                }
            }
            node1 = node2
            node2 = node1.next
        }
        return head
    }
}
