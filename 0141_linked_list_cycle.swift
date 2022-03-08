// https://leetcode.com/problems/linked-list-cycle/

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
	func hasCycle(_ head: ListNode?) -> Bool {
		guard let head = head else { return false }

		var slow = head
		var fast = head

		guard let slowNext = slow.next else { return false }
		slow = slowNext
		guard let fastNext = fast.next, let fastNextNext = fastNext.next else { return false }
		fast = fastNextNext

		while slow !== fast {
			guard let slowNext = slow.next else { return false }
			slow = slowNext
			guard let fastNext = fast.next, let fastNextNext = fastNext.next else { return false }
			fast = fastNextNext
		}

		return true
	}
}
