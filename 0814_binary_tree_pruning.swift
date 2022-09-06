// https://leetcode.com/problems/binary-tree-pruning/

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
	func pruneTree(_ root: TreeNode?) -> TreeNode? {
		let realRoot = TreeNode(1, root, nil)
		isUsefulNode(node: realRoot)
		return realRoot.left
	}

	func isUsefulNode(node: TreeNode) -> Bool {
		var hasUsefulChild = false
		if let left = node.left {
			if isUsefulNode(node: left) {
				hasUsefulChild = true
			} else {
				node.left = nil
			}
		}
		if let right = node.right {
			if isUsefulNode(node: right) {
				hasUsefulChild = true
			} else {
				node.right = nil
			}
		}
		if node.val == 1 {
			return true
		} else if hasUsefulChild {
			return true
		} else {
			return false
		}
	}
}
