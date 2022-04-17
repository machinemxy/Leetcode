// https://leetcode.com/problems/increasing-order-search-tree/

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
    var result = TreeNode()
    var lastNode = TreeNode()

    func increasingBST(_ root: TreeNode?) -> TreeNode? {
        lastNode = result
        guard let root = root else { return root }
        addNode(node: root)
        return result.right
    }

    private func addNode(node: TreeNode) {
        if let left = node.left {
            addNode(node: left)
        }

        node.left = nil
        lastNode.right = node
        lastNode = lastNode.right!

        if let right = node.right {
            addNode(node: right)
        }
    }
}
