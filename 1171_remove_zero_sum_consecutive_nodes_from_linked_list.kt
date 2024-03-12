// https://leetcode.com/problems/remove-zero-sum-consecutive-nodes-from-linked-list/description/

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
    fun removeZeroSumSublists(head: ListNode?): ListNode? {
        val deque = ArrayDeque<ListNode>()
        var node = head
        var sum = 0
        val duplicateSet = mutableSetOf(0)
        while (node != null) {
            deque.add(node)
            sum += node.`val`
            node = node.next
            if (duplicateSet.contains(sum)) {
                val targetSum = sum
                while (true) {
                    val removedNode = deque.removeLast()
                    sum -= removedNode.`val`
                    if (sum == targetSum) {
                        break
                    } else {
                        duplicateSet.remove(sum)
                    }
                }
            } else {
                duplicateSet.add(sum)
            }
        }
        var lastNode = deque.removeLastOrNull()
        lastNode?.next = null
        while (deque.isNotEmpty()) {
            val newLastNode = deque.removeLast()
            newLastNode.next = lastNode
            lastNode = newLastNode
        }
        return lastNode
    }
}
