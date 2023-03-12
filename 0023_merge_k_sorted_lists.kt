// https://leetcode.com/problems/merge-k-sorted-lists/description/

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
    fun mergeKLists(lists: Array<ListNode?>): ListNode? {
        val queue = PriorityQueue<ListNode>(compareBy { it.`val` })
        for (list in lists) {
            list?.let {
                queue.add(it)
            }
        }
        val root = ListNode(0)
        var node = root
        while (queue.isNotEmpty()) {
            val minNode = queue.poll()
            minNode.next?.let { 
                queue.add(it)
                minNode.next = null
            }
            node.next = minNode
            node = node.next!!
        }
        return root.next
    }
}
