// https://leetcode.com/problems/merge-k-sorted-lists/

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
	func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
		var sortedLists = lists.compactMap({ $0 }).sorted(by: { $0.val < $1.val })

		let dummy = ListNode()
		var currentNode = dummy

		while sortedLists.count > 0 {
			let smallest = sortedLists.removeFirst()
			let newNode = ListNode(smallest.val)
			currentNode.next = newNode
			currentNode = newNode

			guard let next = smallest.next else { continue }
			if sortedLists.count == 0 {
				sortedLists.append(next)
			} else if next.val <= sortedLists[0].val {
				sortedLists.insert(next, at: 0)
			} else if next.val >= sortedLists.last!.val {
				sortedLists.append(next)
			} else {
				var l = 0
				var r = sortedLists.count - 1
				while r > (l + 1) {
					let i = (l + r) / 2
					let interValue = sortedLists[i].val
					if next.val == interValue {
						r = i
						l = i - 1
					} else if next.val < interValue {
						r = i
					} else {
						l = i
					}
				}
				sortedLists.insert(next, at: r)
			}
		}

		return dummy.next
	}
}
