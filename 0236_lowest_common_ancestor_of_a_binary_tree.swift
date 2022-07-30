// https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
	func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
		let pResult = search1(node: root!, target: p!.val)
		let qResult = search2(node: root!, target: q!.val)
		for qNode in qResult {
			if pResult.contains(qNode.val) {
				return qNode
			}
		}
		return nil
	}

	private func search1(node: TreeNode, target: Int) -> Set<Int> {
		if node.val == target {
			return [node.val]
		}

		if let left = node.left {
			var leftResult = search1(node: left, target: target)
			if !leftResult.isEmpty {
				leftResult.insert(node.val)
				return leftResult
			}
		}

		if let right = node.right {
			var rightResult = search1(node: right, target: target)
			if !rightResult.isEmpty {
				rightResult.insert(node.val)
				return rightResult
			}
		}

		return []
	}

	private func search2(node: TreeNode, target: Int) -> [TreeNode] {
		if node.val == target {
			return [node]
		}

		if let left = node.left {
			var leftResult = search2(node: left, target: target)
			if !leftResult.isEmpty {
				leftResult.append(node)
				return leftResult
			}
		}

		if let right = node.right {
			var rightResult = search2(node: right, target: target)
			if !rightResult.isEmpty {
				rightResult.append(node)
				return rightResult
			}
		}

		return []
	}
}
