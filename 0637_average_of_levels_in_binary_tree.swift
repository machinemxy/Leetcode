// https://leetcode.com/problems/average-of-levels-in-binary-tree/

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
	func averageOfLevels(_ root: TreeNode?) -> [Double] {
		var nodes = [root!]
		var result = [Double]()
		while !nodes.isEmpty {
			var sum = 0
			var newNodes = [TreeNode]()
			for node in nodes {
				sum += node.val
				if let left = node.left {
					newNodes.append(left)
				}
				if let right = node.right {
					newNodes.append(right)
				}
			}
			result.append(Double(sum) / Double(nodes.count))
			nodes = newNodes
		}
		return result
	}
}
