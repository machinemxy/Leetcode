// https://leetcode.com/problems/construct-string-from-binary-tree/

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
	func tree2str(_ root: TreeNode?) -> String {
		tree2str(node: root!)
	}

	func tree2str(node: TreeNode) -> String {
		var str = "\(node.val)"
		if let left = node.left {
			let leftStr = tree2str(node: left)
			str += ("(\(leftStr))")
			if let right = node.right {
				let rightStr = tree2str(node: right)
				str += ("(\(rightStr))")
			}
		} else {
			if let right = node.right {
				let rightStr = tree2str(node: right)
				str += ("()(\(rightStr))")
			}
		}
		return str
	}
}
