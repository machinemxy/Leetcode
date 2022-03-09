// https://leetcode.com/problems/remove-duplicates-from-sorted-list-ii/

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
	func deleteDuplicates(_ head: ListNode?) -> ListNode? {
		let dummy = ListNode()
		var currentNode = dummy
		var skipNumber = Int.min
		var iteratorNode = head

		while iteratorNode != nil {
			if iteratorNode!.val == skipNumber {
				iteratorNode = iteratorNode!.next
			} else {
				if let nextIteratorNode = iteratorNode!.next, nextIteratorNode.val == iteratorNode!.val {
					skipNumber = iteratorNode!.val
					iteratorNode = iteratorNode!.next
				} else {
					currentNode.next = iteratorNode!
					currentNode = iteratorNode!
					iteratorNode = iteratorNode!.next
					currentNode.next = nil
				}
			}
		}

		return dummy.next
	}
}
