// https://leetcode.com/problems/binary-tree-inorder-traversal/

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
	func inorderTraversal(_ root: TreeNode?) -> [Int] {
		guard let root = root else { return [] }
		return inorderTravesal(node: root)
	}

	func inorderTravesal(node: TreeNode) -> [Int] {
		var result = [node.val]

		if let left = node.left {
			let leftResult = inorderTravesal(node: left)
			result = leftResult + result
		}

		if let right = node.right {
			let rightResult = inorderTravesal(node: right)
			result += rightResult
		}

		return result
	}
}
