// https://leetcode.com/problems/sort-list/

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
	func sortList(_ head: ListNode?) -> ListNode? {
		guard let head = head else { return nil }
		return sort(head)
	}

	private func sort(_ list: ListNode) -> ListNode {
		var length = 1
		var temp = list
		while temp.next != nil {
			temp = temp.next!
			length += 1
		}

		if length == 1 {
			return list
		}

		let half = length / 2
		var count = 1
		temp = list
		while count < half {
			temp = temp.next!
			count += 1
		}
		let secondList = temp.next!
		temp.next = nil

		let sortedList1 = sort(list)
		let sortedList2 = sort(secondList)
		return merge(list1: sortedList1, list2: sortedList2)
	}

	private func merge(list1: ListNode, list2: ListNode) -> ListNode {
		let dummy = ListNode()
		var last: ListNode = dummy
		var temp1: ListNode? = list1
		var temp2: ListNode? = list2
		while temp1 != nil || temp2 != nil  {
			if temp1 == nil {
				last.next = temp2
				temp2 = temp2?.next
				last = last.next!
				last.next = nil
			} else if temp2 == nil {
				last.next = temp1
				temp1 = temp1?.next
				last = last.next!
				last.next = nil
			} else if temp1!.val <= temp2!.val {
				last.next = temp1
				temp1 = temp1?.next
				last = last.next!
				last.next = nil
			} else {
				last.next = temp2
				temp2 = temp2?.next
				last = last.next!
				last.next = nil
			}
		}
		return dummy.next!
	}
}
