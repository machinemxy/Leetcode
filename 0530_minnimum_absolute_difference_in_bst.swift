// https://leetcode.com/problems/minimum-absolute-difference-in-bst/description/

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
    var result = Int.max

    func getMinimumDifference(_ root: TreeNode?) -> Int {
        checkNode(node: root!, leftBound: Int.min, rightBound: Int.max)
		return result
    }

    func checkNode(node: TreeNode, leftBound: Int, rightBound: Int) {
		if leftBound != Int.min {
			let diff = node.val - leftBound
			result = min(result, diff)
		}
		if rightBound != Int.max {
			let diff = rightBound - node.val
			result = min(result, diff)
		}
		if let leftNode = node.left {
			checkNode(node: leftNode, leftBound: leftBound, rightBound: node.val)
		}
		if let rightNode = node.right {
			checkNode(node: rightNode, leftBound: node.val, rightBound: rightBound)
		}
	}
}
