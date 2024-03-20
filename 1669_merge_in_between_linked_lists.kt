// https://leetcode.com/problems/merge-in-between-linked-lists/description/

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
    fun mergeInBetween(list1: ListNode?, a: Int, b: Int, list2: ListNode?): ListNode? {
        var counter = 0
        var nodeA: ListNode? = null
        var nodeB: ListNode? = null
        var node = list1
        while (node != null) {
            if (counter == a - 1) {
                nodeA = node
            } else if (counter == b + 1) {
                nodeB = node
            }
            node = node.next
            counter++
        }
        nodeA?.next = list2
        node = list2
        while (node?.next != null) {
            node = node?.next
        }
        node?.next = nodeB
        return list1
    }
}
