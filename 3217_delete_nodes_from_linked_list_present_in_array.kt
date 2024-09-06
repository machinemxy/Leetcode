// https://leetcode.com/problems/delete-nodes-from-linked-list-present-in-array/description/

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
    fun modifiedList(nums: IntArray, head: ListNode?): ListNode? {
        val set = nums.toSet()
        val mockHead = ListNode(Int.MAX_VALUE)
        var parentNode = mockHead
        var currentNode = head
        while (currentNode != null) {
            if (set.contains(currentNode.`val`)) {
                currentNode = currentNode.next
            } else {
                parentNode.next = currentNode
                parentNode = currentNode
                currentNode = currentNode.next
                parentNode.next = null
            }
        }
        return mockHead.next
    }
}
