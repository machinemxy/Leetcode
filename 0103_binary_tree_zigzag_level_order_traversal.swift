// https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal/description/

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
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        
        var result = [[Int]]()
        var nodes = [root]
        var isNormalOrder = true
        while !nodes.isEmpty {
            if isNormalOrder {
                result.append(nodes.map({ $0.val }))
            } else {
                result.append(nodes.map({ $0.val }).reversed())
            }
            isNormalOrder = !isNormalOrder
            
            let nodesCount = nodes.count
            for _ in 0..<nodesCount {
                let node = nodes.removeFirst()
                if let left = node.left {
                    nodes.append(left)
                }
                if let right = node.right {
                    nodes.append(right)
                }
            }
        }
        return result
    }
}
