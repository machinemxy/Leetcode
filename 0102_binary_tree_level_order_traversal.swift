// https://leetcode.com/problems/binary-tree-level-order-traversal/

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
	func levelOrder(_ root: TreeNode?) -> [[Int]] {
		guard var root = root else { return [] }

		var layer = [root]
		var result = [[root.val]]

		while true {
			var newLayer = [TreeNode]()
			for node in layer {
				if let left = node.left {
					newLayer.append(left)
				}
				if let right = node.right {
					newLayer.append(right)
				}
			}
			if newLayer.isEmpty {
				break
			} else {
				result.append(newLayer.map {$0.val})
				layer = newLayer
			}
		}

		return result
	}
}
