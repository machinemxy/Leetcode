// https://leetcode.com/problems/recover-binary-search-tree/

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
	var maxNode: TreeNode?
	var wrongNode: TreeNode?
	var changeCandidate: TreeNode?

	func recoverTree(_ root: TreeNode?) {
		validateWrongNode(node: root!)
		if let wrongNode = wrongNode, let changeCandidate = changeCandidate {
			let temp = wrongNode.val
			wrongNode.val = changeCandidate.val
			changeCandidate.val = temp
		}
	}

	private func validateWrongNode(node: TreeNode) {
		if let left = node.left {
			validateWrongNode(node: left)
		}

		if let unwrappedMaxNode = maxNode, node.val < unwrappedMaxNode.val {
			if wrongNode == nil {
				wrongNode = unwrappedMaxNode
				changeCandidate = node
				maxNode = node
			} else {
				changeCandidate = node
			}
		} else {
			maxNode = node
		}

		if let right = node.right {
			validateWrongNode(node: right)
		}
	}
}
