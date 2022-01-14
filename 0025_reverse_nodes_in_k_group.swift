// https://leetcode.com/problems/reverse-nodes-in-k-group/

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
	func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
		guard k > 1 else { return head }

		var current = head
		let dummy = ListNode()
		var latestNodeOfResult = dummy
		var a = [ListNode]()

		while current != nil {
			a.append(current!)
			current = current?.next

			if a.count == k {
				for i in stride(from: k - 1, to: 0, by: -1) {
					a[i].next = a[i - 1]
				}
				a[0].next = nil
				latestNodeOfResult.next = a[k - 1]
				latestNodeOfResult = a[0]
				a = [ListNode]()
			}
		}

		if let restFirstNodeInArray = a.first {
			latestNodeOfResult.next = restFirstNodeInArray
		}

		return dummy.next
	}
}
