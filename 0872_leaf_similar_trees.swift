// https://leetcode.com/problems/leaf-similar-trees/description/

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
	var array1 = [Int]()
	var array2 = [Int]()

	func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
		check1(node: root1!)
		check2(node: root2!)
		return array1 == array2
	}

	func check1(node: TreeNode) {
		if node.left == nil && node.right == nil {
			array1.append(node.val)
			return
		}
		if let left = node.left {
			check1(node: left)
		}
		if let right = node.right {
			check1(node: right)
		}
	}

	func check2(node: TreeNode) {
		if node.left == nil && node.right == nil {
			array2.append(node.val)
			return
		}
		if let left = node.left {
			check2(node: left)
		}
		if let right = node.right {
			check2(node: right)
		}
	}
}
