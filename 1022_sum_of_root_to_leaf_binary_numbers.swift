// https://leetcode.com/problems/sum-of-root-to-leaf-binary-numbers/

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
	var sum = 0

	func sumRootToLeaf(_ root: TreeNode?) -> Int {
		guard let root = root else { return 0 }
		check(stored: 0, node: root)
		return sum
	}

	private func check(stored: Int, node: TreeNode) {
		let newValue = stored * 2 + node.val

		if node.left == nil && node.right == nil {
			sum += newValue
			return
		}

		if let left = node.left {
			check(stored: newValue, node: left)
		}

		if let right = node.right {
			check(stored: newValue, node: right)
		}
	}
}
