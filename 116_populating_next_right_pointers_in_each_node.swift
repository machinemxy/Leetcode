// https://leetcode.com/problems/populating-next-right-pointers-in-each-node/

/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var left: Node?
 *     public var right: Node?
 *	   public var next: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func connect(_ root: Node?) -> Node? {
        guard let uRoot = root else { return nil }

        var arr1 = [uRoot]
        while arr1.count > 0 {
            var arr2 = [Node]()
            for node in arr1 {
                if let l = node.left {
                    arr2.append(l)
                }
                if let r = node.right {
                    arr2.append(r)
                }
            }

            if arr2.count > 1 {
                for i in 0..<(arr2.count - 1) {
                    arr2[i].next = arr2[i + 1]
                }
            }
            arr1 = arr2
        }

        return uRoot
    }
}
