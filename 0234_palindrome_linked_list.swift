// https://leetcode.com/problems/palindrome-linked-list/

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
	var stored = ListNode()

	func isPalindrome(_ head: ListNode?) -> Bool {
		guard let head = head else { return true }

		stored = head
		return check(node: head)
	}

	func check(node: ListNode) -> Bool {
		if let next = node.next {
			let nextCheckResult = check(node: next)
			if !nextCheckResult {
				return false
			}
		}

		if stored.val == node.val {
			if let next = stored.next {
				stored = next
			}
			return true
		} else {
			return false
		}
	}
}
