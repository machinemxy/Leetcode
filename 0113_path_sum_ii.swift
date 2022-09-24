// https://leetcode.com/problems/path-sum-ii/

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
    var result = [[Int]]()
    
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        guard let root = root else { return [] }
        check(node: root, chain: [], target: targetSum)
        return result
    }
    
    func check(node: TreeNode, chain: [Int], target: Int) {
        var hasChildren = false
        var newChain = chain
        newChain.append(node.val)
        let newTarget = target - node.val
        if let left = node.left {
            hasChildren = true
            check(node: left, chain: newChain, target: newTarget)
        }
        if let right = node.right {
            hasChildren = true
            check(node: right, chain: newChain, target: newTarget)
        }
        if !hasChildren {
            if newTarget == 0 {
                result.append(newChain)
            }
        }
    }
}
