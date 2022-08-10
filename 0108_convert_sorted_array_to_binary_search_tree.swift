// https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/

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
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        let mid = nums.count / 2
        let node = TreeNode(nums[mid])
        if mid != 0 {
            let leftNums = Array(nums[0..<mid])
            let leftNode = sortedArrayToBST(leftNums)
            node.left = leftNode
        }
        if mid != nums.count - 1 {
            let rightNums = Array(nums[(mid + 1)..<nums.count])
            let rightNode = sortedArrayToBST(rightNums)
            node.right = rightNode
        }
        return node
    }
}
