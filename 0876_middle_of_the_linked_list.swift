// https://leetcode.com/problems/middle-of-the-linked-list/

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
    func middleNode(_ head: ListNode?) -> ListNode? {
        var nodes = [ListNode]()
        var node = head
        while true {
            if let uNode = node {
                nodes.append(uNode)
                node = uNode.next
            } else {
                break
            }
        }
        if nodes.count % 2 == 0 {
            let i = nodes.count / 2
            return nodes[i]
        } else {
            let i = (nodes.count - 1) / 2
            return nodes[i]
        }
    }
}

class Solution2 {
	func middleNode(_ head: ListNode?) -> ListNode? {
		var slow = head
		var fast = head?.next
		while fast != nil {
			slow = slow?.next
			fast = fast?.next?.next
		}
		return slow
	}
}
