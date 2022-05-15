// https://leetcode.com/problems/deepest-leaves-sum/

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
    func deepestLeavesSum(_ root: TreeNode?) -> Int {
        var layer = [root!]
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
                layer = newLayer
            }
        }

        var sum = 0
        for node in layer {
            sum += node.val
        }
        return sum
    }
}
