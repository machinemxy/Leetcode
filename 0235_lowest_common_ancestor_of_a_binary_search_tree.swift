// https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        var arrayToReachP = [TreeNode]()
        var node = root!
        while true {
            arrayToReachP.append(node)
            if node.val == p!.val {
                break
            } else if p!.val > node.val {
                node = node.right!
            } else {
                node = node.left!
            }
        }
        
        var setToReachQ = Set<Int>()
        node = root!
        while true {
            setToReachQ.insert(node.val)
            if node.val == q!.val {
                break
            } else if q!.val > node.val {
                node = node.right!
            } else {
                node = node.left!
            }
        }
        
        for node in arrayToReachP.reversed() {
            if setToReachQ.contains(node.val) {
                return node
            }
        }
        
        return nil
    }
}
