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

// Tricky solution
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


// Better solution
class Solution2 {
 func detectCycle(_ head: ListNode?) -> ListNode? {
	 var slow = head
	 var fast = head

	 while true {
		 guard let twoStepFurther = fast?.next?.next else {
			 return nil
		 }

		 fast = twoStepFurther
		 slow = slow?.next!

		 // is circle
		 if fast === slow {
			 slow = head
			 while slow !== fast {
				 slow = slow?.next
				 fast = fast?.next
			 }
			 return slow
		 }
	 }
 }
}
