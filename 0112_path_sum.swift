// https://leetcode.com/problems/path-sum/

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
	func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
		guard let root = root else { return false }
		return check(node: root, target: targetSum)
	}

	func check(node: TreeNode, target: Int) -> Bool {
		let newTarget = target - node.val
		var hasChild = false
		if let left = node.left {
			hasChild = true
			let leftResult = check(node: left, target: newTarget)
			if leftResult {
				return true
			}
		}
		if let right = node.right {
			hasChild = true
			let rightResult = check(node: right, target: newTarget)
			if rightResult {
				return true
			}
		}
		if hasChild {
			return false
		} else {
			return newTarget == 0
		}
	}
}
