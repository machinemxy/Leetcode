// https://leetcode.com/problems/delete-the-middle-node-of-a-linked-list/

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
	func deleteMiddle(_ head: ListNode?) -> ListNode? {
		let dummyNode = ListNode(0, head)
		var fastNode = dummyNode
		var slowNode = dummyNode
		while true {
			if let newFastNode = fastNode.next?.next {
				fastNode = newFastNode
				slowNode = slowNode.next!
			} else {
				slowNode.next = slowNode.next?.next
				break
			}
		}
		return dummyNode.next
	}
}
