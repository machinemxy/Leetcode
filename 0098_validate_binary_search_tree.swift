// https://leetcode.com/problems/validate-binary-search-tree/

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
    func isValidBST(_ root: TreeNode?) -> Bool {
        isValid(node: root!, minVal: Int.min, maxVal: Int.max)
    }
    
    private func isValid(node: TreeNode, minVal: Int, maxVal: Int) -> Bool {
        if node.val <= minVal || node.val >= maxVal {
            return false
        }
        
        if let left = node.left {
            let leftResult = isValid(node: left, minVal: minVal, maxVal: node.val)
            if leftResult == false {
                return false
            }
        }
        
        if let right = node.right {
            let rightResult = isValid(node: right, minVal: node.val, maxVal: maxVal)
            if rightResult == false {
                return false
            }
        }
        
        return true
    }
}
