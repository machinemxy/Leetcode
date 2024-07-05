// https://leetcode.com/problems/find-the-minimum-and-maximum-number-of-nodes-between-critical-points/description/

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
    fun nodesBetweenCriticalPoints(head: ListNode?): IntArray {
        var minDistance = Int.MAX_VALUE
        var maxDistance = Int.MIN_VALUE
        var firstCriticalPointId = -1
        var previousCriticalPointId = -1
        var i = 1
        var node = head!!.next!!
        var prevNode = head!!
        while (node.next != null) {
            if ((node.`val` > prevNode.`val` && node.`val` > node.next!!.`val`) || (node.`val` < prevNode.`val` && node.`val` < node.next!!.`val`)) {
                if (firstCriticalPointId == -1) {
                    firstCriticalPointId = i
                } else {
                    maxDistance = i - firstCriticalPointId
                }
                if (previousCriticalPointId != -1) {
                    minDistance = min(minDistance, i - previousCriticalPointId)
                }
                previousCriticalPointId = i
            }

            prevNode = node
            node = node.next!!
            i++
        }
        if (minDistance == Int.MAX_VALUE) {
            return intArrayOf(-1, -1)
        } else {
            return intArrayOf(minDistance, maxDistance)
        }
    }
}
