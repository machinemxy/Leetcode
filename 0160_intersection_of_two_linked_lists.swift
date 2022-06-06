// https://leetcode.com/problems/intersection-of-two-linked-lists/

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
	func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
		var listA = [ListNode]()
		var nodeA = headA
		while nodeA != nil {
			listA.insert(nodeA!, at: 0)
			nodeA = nodeA!.next
		}

		var listB = [ListNode]()
		var nodeB = headB
		while nodeB != nil {
			listB.insert(nodeB!, at: 0)
			nodeB = nodeB!.next
		}

		let shorterListCount = min(listA.count, listB.count)
		for i in 0..<shorterListCount {
			if listA[i] === listB[i] {
				continue
			}

			if i == 0 {
				return nil
			} else {
				return listA[i - 1]
			}
		}

		return listA[shorterListCount - 1]
	}
}
