// https://leetcode.com/problems/maximum-width-of-binary-tree/

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        root.val = 0
        var nodes = [root]
        var result = 1

        while nodes.count > 0 {
            var newNodes = [TreeNode]()

            for node in nodes {
                if let left = node.left {
                    left.val = node.val * 2
                    newNodes.append(left)
                }

                if let right = node.right {
                    right.val = node.val * 2 + 1
                    newNodes.append(right)
                }
            }


            if newNodes.count > 0 {
                // there are some tricky test cases that want to make our val exceed Int border
                let firstVal = newNodes.first!.val
                for newNode in newNodes {
                    newNode.val -= firstVal
                }
                result = max(result, newNodes.last!.val + 1)
            }
            nodes = newNodes
        }

        return result
    }
}
