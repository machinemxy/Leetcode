// https://leetcode.com/problems/linked-list-cycle-ii/

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
