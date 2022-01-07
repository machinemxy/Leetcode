// https://leetcode.com/problems/linked-list-random-node/

class Solution {
	private let head: ListNode

	init(_ head: ListNode?) {
		self.head = head!
	}

	func getRandom() -> Int {
		var picked = head.val
		var tNode = head

		var i = 2
		while let next = tNode.next {
			let random = Int.random(in: 1...i)
			if random == 1 {
				picked = next.val
			}

			tNode = next
			i += 1
		}

		return picked
	}
}
