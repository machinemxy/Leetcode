// https://leetcode.com/problems/binary-search-tree-iterator/

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

class BSTIterator {
	var root = TreeNode()
	var current: TreeNode

	init(_ root: TreeNode?) {
		current = self.root
		addNode(node: root!)
		current = self.root
	}

	func next() -> Int {
		current = current.right!
		return current.val
	}

	func hasNext() -> Bool {
		!(current.right == nil)
	}

	private func addNode(node: TreeNode) {
		if let left = node.left {
			addNode(node: left)
		}

		current.right = node
		current = current.right!

		if let right = node.right {
			addNode(node: right)
		}
	}
}

/**
 * Your BSTIterator object will be instantiated and called as such:
 * let obj = BSTIterator(root)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */
