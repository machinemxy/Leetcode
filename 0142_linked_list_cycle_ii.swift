// https://leetcode.com/problems/linked-list-cycle-ii/
// This is a tricky solution

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
	func detectCycle(_ head: ListNode?) -> ListNode? {
		let million = 1_000_000
		var node = head

		while true {
			if let uNode = node {
				if uNode.val >= 900_000 {
					uNode.val -= million
					return uNode
				} else {
					uNode.val += million
					node = uNode.next
				}
			} else {
				return nil
			}
		}
	}
}
