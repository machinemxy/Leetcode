// https://leetcode.com/problems/partition-list/

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
	func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
		let headForSmallerThanX = ListNode()
		var nodeForSmallerThanX = headForSmallerThanX
		let headForLargerThanX = ListNode()
		var nodeForLargerThanX = headForLargerThanX
		var node = head
		while node != nil {
			let unwrappedNode = node!
			node = unwrappedNode.next
			unwrappedNode.next = nil
			if unwrappedNode.val < x {
				nodeForSmallerThanX.next = unwrappedNode
				nodeForSmallerThanX = unwrappedNode
			} else {
				nodeForLargerThanX.next = unwrappedNode
				nodeForLargerThanX = unwrappedNode
			}
		}
		nodeForSmallerThanX.next = headForLargerThanX.next
		return headForSmallerThanX.next
	}
}
