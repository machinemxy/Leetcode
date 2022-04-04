// https://leetcode.com/problems/swapping-nodes-in-a-linked-list/

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
	func swapNodes(_ head: ListNode?, _ k: Int) -> ListNode? {
		guard head?.next != nil else { return head }

		var array = [ListNode]()
		var node = head
		while node != nil {
			array.append(node!)
			node = node?.next
		}

		let swap1 = k - 1
		let swap2 = array.count - k
		if swap1 != swap2 {
			let temp = array[swap1]
			array[swap1] = array[swap2]
			array[swap2] = temp
		}

		for i in 0..<(array.count - 1) {
			array[i].next = array[i + 1]
		}
		array[array.count - 1].next = nil

		return array.first
	}
}
