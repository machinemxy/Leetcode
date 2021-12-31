// https://leetcode.com/problems/maximum-difference-between-node-and-ancestor/

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
    var result = 0
    
    func maxAncestorDiff(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        checkNode(node: root, max: root.val, min: root.val)
        return result
    }

    private func checkNode(node: TreeNode, max imax: Int, min imin: Int) {
        var newMax = max(imax, node.val)
        var newMin = min(imin, node.val)
        if let leftNode = node.left {
            checkNode(node: leftNode, max: newMax, min: newMin)
            if let rightNode = node.right {
                checkNode(node: rightNode, max: newMax, min: newMin)
            }
        } else {
            if let rightNode = node.right {
                checkNode(node: rightNode, max: newMax, min: newMin)
            } else {
                result = max(result, newMax - newMin)
            }
        }
    }
}
