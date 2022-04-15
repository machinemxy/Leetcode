// https://leetcode.com/problems/trim-a-binary-search-tree/

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
	func trimBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> TreeNode? {
		var root = root
		var node = root
		var parentNode: TreeNode? = nil

		while node != nil {
			if node!.val < low {
				node = node?.right

				if parentNode == nil {
					root = node
				} else {
					parentNode?.left = node
				}
			} else {
				parentNode = node
				node = node?.left
			}
		}

		node = root
		parentNode = nil

		while node != nil {
			if node!.val > high {
				node = node?.left

				if parentNode == nil {
					root = node
				} else {
					parentNode?.right = node
				}
			} else {
				parentNode = node
				node = node?.right
			}
		}

		return root
	}
}
