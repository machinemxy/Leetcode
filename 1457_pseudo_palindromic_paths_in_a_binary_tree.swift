// https://leetcode.com/problems/pseudo-palindromic-paths-in-a-binary-tree/

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

	func pseudoPalindromicPaths (_ root: TreeNode?) -> Int {
		checkNode(node: root!, set: [])
		return result
	}

	func checkNode(node: TreeNode, set: Set<Int>) {
		var newSet = set
		if newSet.contains(node.val) {
			newSet.remove(node.val)
		} else {
			newSet.insert(node.val)
		}

		if let left = node.left {
			checkNode(node: left, set: newSet)
			if let right = node.right {
				checkNode(node: right, set: newSet)
			}
		} else {
			if let right = node.right {
				checkNode(node: right, set: newSet)
			} else {
				if newSet.count <= 1 {
					result += 1
				}
			}
		}
	}
}
