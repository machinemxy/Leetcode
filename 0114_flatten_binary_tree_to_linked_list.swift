// https://leetcode.com/problems/flatten-binary-tree-to-linked-list/

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
	private let dummyRoot = TreeNode()
	private var lastNode = TreeNode()

	func flatten(_ root: TreeNode?) {
		guard let root = root else { return }
		lastNode = dummyRoot
		appendNode(node: root)
	}

	private func appendNode(node: TreeNode) {
		let left = node.left
		let right = node.right
		node.left = nil
		node.right = nil
		lastNode.right = node
		lastNode = node

		if let left = left {
			appendNode(node: left)
		}

		if let right = right {
			appendNode(node: right)
		}
	}
}
