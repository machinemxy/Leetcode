// https://leetcode.com/problems/linked-list-random-node/description/

/**
 * Example:
 * var li = ListNode(5)
 * var v = li.`val`
 * Definition for singly-linked list.
 * class ListNode(var `val`: Int) {
 *     var next: ListNode? = null
 * }
 */

class Solution(private val head: ListNode?) {
    private val secureRandom = SecureRandom()

    fun getRandom(): Int {
        var node = head?.next
        var result = head!!.`val`
        var denominator = 2
        while (node != null) {
            if (secureRandom.nextInt(denominator) == 0) {
                result = node.`val`
            }
            node = node.next
            denominator++
        }
        return result
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * var obj = Solution(head)
 * var param_1 = obj.getRandom()
 */
