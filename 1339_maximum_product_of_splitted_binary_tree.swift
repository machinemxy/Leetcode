// https://leetcode.com/problems/maximum-product-of-splitted-binary-tree/description/

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
    var sum = 0
    var maxProduct = 0
    
    func maxProduct(_ root: TreeNode?) -> Int {
        calcSum(node: root!)
        calc(node: root!)
        return maxProduct % 1000000007
    }
    
    func calcSum(node: TreeNode) {
        sum += node.val
        if let left = node.left {
            calcSum(node: left)
        }
        if let right = node.right {
            calcSum(node: right)
        }
    }
    
    func calc(node: TreeNode) -> Int {
        var subTreeSum = node.val
        if let left = node.left {
            let leftSum = calc(node: left)
            subTreeSum += leftSum
        }
        if let right = node.right {
            let rightSum = calc(node: right)
            subTreeSum += rightSum
        }
        let product = subTreeSum * (sum - subTreeSum)
        maxProduct = max(maxProduct, product)
        return subTreeSum
    }
}
