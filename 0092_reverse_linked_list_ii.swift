// https://leetcode.com/problems/reverse-linked-list-ii/

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
	private var id = 1
	private var right = 0

	func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
		self.right = right
		let dummyNode = ListNode()
		dummyNode.next = head
		var node = head!
		var prevNode = dummyNode

		while id < left {
			prevNode = node
			node = prevNode.next!
			id += 1
		}

		let reversedSubList = getReversedSubList(node: node)
		prevNode.next = reversedSubList.rootNode
		node.next = reversedSubList.nextNodeOutOfSubList

		return dummyNode.next
	}

	private func getReversedSubList(node: ListNode) -> ReversedSubList {
		if id == right {
			return ReversedSubList(rootNode: node, currentNode: node, nextNodeOutOfSubList: node.next)
		} else {
			let nextNode = node.next!
			id += 1
			var reversedSubList = getReversedSubList(node: nextNode)
			reversedSubList.currentNode.next = node
			reversedSubList.currentNode = node
			return reversedSubList
		}
	}
}

fileprivate struct ReversedSubList {
	let rootNode: ListNode
	var currentNode: ListNode
	let nextNodeOutOfSubList: ListNode?
}
