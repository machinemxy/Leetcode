// https://leetcode.com/problems/binary-tree-right-side-view/

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
	func rightSideView(_ root: TreeNode?) -> [Int] {
		guard let root = root else { return [] }

		var layer = [root]
		var result = [root.val]
		while true {
			var newLayer = [TreeNode]()

			for nodesInLayer in layer {
				if let left = nodesInLayer.left {
					newLayer.append(left)
				}
				if let right = nodesInLayer.right {
					newLayer.append(right)
				}
			}

			if newLayer.isEmpty {
				break
			} else {
				result.append(newLayer.last!.val)
				layer = newLayer
			}
		}

		return result
	}
}
