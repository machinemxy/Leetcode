// https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/

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
	private var preorder = [Int]()
	private var inorder = [Int]()
	private var preorderIndex = 0

	func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
		self.preorder = preorder
		self.inorder = inorder
		return getNode(leftInorderIndex: 0, rightInorderIndex: inorder.count - 1)
	}

	private func getNode(leftInorderIndex: Int, rightInorderIndex: Int) -> TreeNode? {
		if leftInorderIndex > rightInorderIndex {
			return nil
		}

		let val = preorder[preorderIndex]
		preorderIndex += 1
		let node = TreeNode(val)
		let inorderIndex = inorder.firstIndex(of: val)!
		node.left = getNode(leftInorderIndex: leftInorderIndex, rightInorderIndex: inorderIndex - 1)
		node.right = getNode(leftInorderIndex: inorderIndex + 1, rightInorderIndex: rightInorderIndex)
		return node
	}
}
