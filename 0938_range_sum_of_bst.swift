// https://leetcode.com/problems/range-sum-of-bst/description/

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
	var low = 0
	var high = 0

	func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
		self.low = low
		self.high = high
		check(node: root!)
		return sum
	}

	func check(node: TreeNode) {
		if node.val < low {
			if let right = node.right {
				check(node: right)
			}
		} else if node.val > high {
			if let left = node.left {
				check(node: left)
			}
		} else {
			sum += node.val
			if let left = node.left {
				check(node: left)
			}
			if let right = node.right {
				check(node: right)
			}
		}
	}
}
