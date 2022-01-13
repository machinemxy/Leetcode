// https://leetcode.com/problems/swap-nodes-in-pairs/

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
	func swapPairs(_ head: ListNode?) -> ListNode? {
		guard var current = head else { return nil }
		let dummy = ListNode()
		var result = dummy
		var temp: ListNode?

		while true {
			if let uTemp = temp {
				uTemp.next = current.next
				current.next = uTemp
				result.next = current
				result = uTemp
				temp = nil
				if let next = uTemp.next {
					current = next
				} else {
					break
				}
			} else {
				temp = current
				if let next = current.next {
					current = next
				} else {
					break
				}
			}
		}

		if let uTemp = temp {
			result.next = uTemp
		}

		return dummy.next
	}
}
