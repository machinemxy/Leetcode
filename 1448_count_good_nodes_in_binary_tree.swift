// https://leetcode.com/problems/count-good-nodes-in-binary-tree/

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
	var result = 0

	func goodNodes(_ root: TreeNode?) -> Int {
		check(node: root!, maxVal: Int.min)
		return result
	}

	func check(node: TreeNode, maxVal: Int) {
		if node.val >= maxVal {
			result += 1
		}
		let newMaxVal = max(maxVal, node.val)
		if let left = node.left {
			check(node: left, maxVal: newMaxVal)
		}
		if let right = node.right {
			check(node: right, maxVal: newMaxVal)
		}
	}
}
