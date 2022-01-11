// https://leetcode.com/problems/merge-two-sorted-lists/

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
	func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
		guard let list1 = list1 else { return list2 }
		guard let list2 = list2 else { return list1 }

		var latestNodeOfList1: ListNode? = list1
		var latestNodeOfList2: ListNode? = list2
		let result = ListNode()
		var latestNodeOfResult = result
		if list1.val < list2.val {
			latestNodeOfResult.val = list1.val
			latestNodeOfList1 = list1.next
		} else {
			latestNodeOfResult.val = list2.val
			latestNodeOfList2 = list2.next
		}

		while !(latestNodeOfList1 == nil && latestNodeOfList2 == nil) {
			if latestNodeOfList1 == nil {
				let temp = ListNode(latestNodeOfList2!.val)
				latestNodeOfList2 = latestNodeOfList2!.next
				latestNodeOfResult.next = temp
				latestNodeOfResult = temp
			} else if latestNodeOfList2 == nil {
				let temp = ListNode(latestNodeOfList1!.val)
				latestNodeOfList1 = latestNodeOfList1!.next
				latestNodeOfResult.next = temp
				latestNodeOfResult = temp
			} else if latestNodeOfList1!.val < latestNodeOfList2!.val {
				let temp = ListNode(latestNodeOfList1!.val)
				latestNodeOfList1 = latestNodeOfList1!.next
				latestNodeOfResult.next = temp
				latestNodeOfResult = temp
			} else {
				let temp = ListNode(latestNodeOfList2!.val)
				latestNodeOfList2 = latestNodeOfList2!.next
				latestNodeOfResult.next = temp
				latestNodeOfResult = temp
			}
		}

		return result
	}
}
Generate Parentheses
