// https://leetcode.com/problems/copy-list-with-random-pointer/

/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var next: Node?
 *     public var random: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *    	   self.random = nil
 *     }
 * }
 */

class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        // Make A -> A' -> B -> B'
        var iNode = head
        while iNode != nil {
            let copy = Node(iNode!.val)
            copy.next = iNode?.next
            iNode?.next = copy
            iNode = copy.next
        }

        // Set random of copy
        iNode = head
        while iNode != nil {
            iNode?.next?.random = iNode?.random?.next
            iNode = iNode?.next?.next
        }

        // Move copy nodes to result
        let result = Node(Int.min)
        var resultLast = result
        iNode = head
        while iNode != nil {
            resultLast.next = iNode?.next
            resultLast = resultLast.next!
            iNode?.next = iNode?.next?.next
            iNode = iNode?.next
        }

        return result.next
    }
}
