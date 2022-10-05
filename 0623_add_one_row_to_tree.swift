// https://leetcode.com/problems/add-one-row-to-tree/

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
	func addOneRow(_ root: TreeNode?, _ val: Int, _ depth: Int) -> TreeNode? {
		let dummyNode = TreeNode(0, root, nil)
		checkAndInsert(node: dummyNode, currentDepth: 1, val: val, depth: depth)
		return dummyNode.left
	}

	func checkAndInsert(node: TreeNode, currentDepth: Int, val: Int, depth: Int) {
		if currentDepth == depth {
			if let left = node.left {
				let newLeft = TreeNode(val, left, nil)
				node.left = newLeft
			} else {
				node.left = TreeNode(val)
			}

			if let right = node.right {
				let newRight = TreeNode(val, nil, right)
				node.right = newRight
			} else {
				node.right = TreeNode(val)
			}
		} else {
			if let left = node.left {
				checkAndInsert(node: left, currentDepth: currentDepth + 1, val: val, depth: depth)
			}

			if let right = node.right {
				checkAndInsert(node: right, currentDepth: currentDepth + 1, val: val, depth: depth)
			}
		}
	}
}
