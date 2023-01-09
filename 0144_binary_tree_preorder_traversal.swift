// https://leetcode.com/problems/binary-tree-preorder-traversal/description/

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
    var result = [Int]()
    
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        add(node: root)
        return result
    }
    
    func add(node: TreeNode?) {
        guard let node = node else { return }
        result.append(node.val)
        add(node: node.left)
        add(node: node.right)
    }
}
