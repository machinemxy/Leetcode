// https://leetcode.com/problems/maximum-depth-of-binary-tree/

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
	func maxDepth(_ root: TreeNode?) -> Int {
		guard let root = root else { return 0 }
		var layer = [root]
		var layerCount = 0
		while layer.count > 0 {
			var newLayer = [TreeNode]()
			for node in layer {
				if let left = node.left {
					newLayer.append(left)
				}

				if let right = node.right {
					newLayer.append(right)
				}
			}
			layer = newLayer
			layerCount += 1
		}
		return layerCount
	}
}
