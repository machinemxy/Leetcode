// https://leetcode.com/problems/rotate-list/

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
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil {
            return nil
        }

        var countNode = head!
        var count = 1
        while countNode.next != nil {
            count += 1
            countNode = countNode.next!
        }

        let k = k % count

        if k == 0 {
            return head
        }

        let breakPoint = count - k
        var i = 1
        var iteratorNode = head!
        while i < breakPoint {
            iteratorNode = iteratorNode.next!
            i += 1
        }
        let newHead = iteratorNode.next
        iteratorNode.next = nil
        countNode.next = head
        return newHead
    }
}
