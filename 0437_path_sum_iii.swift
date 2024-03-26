// https://leetcode.com/problems/path-sum-iii/description/

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
    private var result = 0
    private var target = 0
    
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> Int {
        target = targetSum
        let map = [0: 1]
        if let root {
            check(node: root, prevSum: 0, map: map)
        }
        return result
    }
    
    private func check(node: TreeNode, prevSum: Int, map: [Int: Int]) {
        let sum = prevSum + node.val
        if let add = map[sum - target] {
            result += add
        }
        var newMap = map
        newMap[sum] = newMap[sum, default: 0] + 1
        if let left = node.left {
            check(node: left, prevSum: sum, map: newMap)
        }
        if let right = node.right {
            check(node: right, prevSum: sum, map: newMap)
        }
    }
}
