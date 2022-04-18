// https://leetcode.com/problems/kth-smallest-element-in-a-bst/

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
	private var k = 0
	private var currentK = 1

	func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
		self.k = k
		return find(node: root!) ?? 0
	}

	private func find(node: TreeNode) -> Int? {
		if let left = node.left {
			if let result = find(node: left) {
				return result
			}
		}

		if currentK == k {
			return node.val
		} else {
			currentK += 1
		}

		if let right = node.right {
			if let result = find(node: right) {
				return result
			}
		}

		return nil
	}
}
