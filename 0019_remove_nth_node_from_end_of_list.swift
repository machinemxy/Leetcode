// https://leetcode.com/problems/remove-nth-node-from-end-of-list/

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
    var n = 0

    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard let head = head else { return nil }
        self.n = n
        let (_, node) = checkNodeFromEnd(node: head)
        return node
    }

    private func checkNodeFromEnd(node: ListNode) -> (Int, ListNode?) {
        guard let next = node.next else {
            if n == 1 {
                return (1, nil)
            } else {
                return (1, node)
            }
        }

        let (nextId, nextNode) = checkNodeFromEnd(node: next)
        let currentId = nextId + 1
        if currentId == n {
            return (currentId, nextNode)
        } else {
            node.next = nextNode
            return (currentId, node)
        }
    }
}
