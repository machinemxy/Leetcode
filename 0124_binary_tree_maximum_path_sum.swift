// https://leetcode.com/problems/binary-tree-maximum-path-sum/

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
	var maxSum = Int.min

	func maxPathSum(_ root: TreeNode?) -> Int {
		check(node: root!)
		return maxSum
	}

	func check(node: TreeNode) -> Int {
		var maxLeftSum = 0
		var maxRightSum = 0
		if let left = node.left {
			let leftSum = check(node: left)
			maxLeftSum = max(leftSum, 0)
		}
		if let right = node.right {
			let rightSum = check(node: right)
			maxRightSum = max(rightSum, 0)
		}
		maxSum = max(maxSum, node.val + maxLeftSum + maxRightSum)
		return node.val + max(maxLeftSum, maxRightSum)
	}
}
