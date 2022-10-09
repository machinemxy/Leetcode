// https://leetcode.com/problems/two-sum-iv-input-is-a-bst/

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
    var set: Set<Int> = []
    var k = 0
    
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        self.k = k
        return check(node: root!)
    }
    
    func check(node: TreeNode) -> Bool {
        let anotherVal = k - node.val
        if set.contains(anotherVal) { return true }
        set.insert(node.val)
        
        if let left = node.left {
            let leftResult = check(node: left)
            if leftResult { return true }
        }
        
        if let right = node.right {
            let rightResult = check(node: right)
            if rightResult { return true }
        }
        
        return false
    }
}
