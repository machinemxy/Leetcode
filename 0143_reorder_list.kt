// https://leetcode.com/problems/reorder-list/description/

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
    private var operations = 0
    private var currentNode: ListNode? = null
    
    fun reorderList(head: ListNode?): Unit {
        var count = 0
        var node = head
        while (node != null) {
            count += 1
            node = node.next
        }
        operations = count / 2
        currentNode = head
        operate(head!!)
        currentNode?.next = null
    }
    
    private fun operate(node: ListNode) {
        if (node.next != null) {
            operate(node.next!!)
        }

        if (operations > 0) {
            operations--
            val nextNode = currentNode?.next
            currentNode?.next = node
            node.next = nextNode
            currentNode = nextNode
        }
    } 
}
