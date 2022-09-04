// https://leetcode.com/problems/vertical-order-traversal-of-a-binary-tree/

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
    var result = [[PositionNode]]()

    func verticalTraversal(_ root: TreeNode?) -> [[Int]] {
        var layer = [PositionNode(y: 0, x: 0, node: root!)]
        result.append(layer)

        while !layer.isEmpty {
            var newLayer = [PositionNode]()
            for positionNode in layer {
                if let left = positionNode.node.left {
                    let leftPositionNode = PositionNode(y: positionNode.y + 1, x: positionNode.x - 1, node: left)
                    addToResult(positionNode: leftPositionNode)
                    newLayer.append(leftPositionNode)
                }

                if let right = positionNode.node.right {
                    let rightPositionNode = PositionNode(y: positionNode.y + 1, x: positionNode.x + 1, node: right)
                    addToResult(positionNode: rightPositionNode)
                    newLayer.append(rightPositionNode)
                }
            }
            layer = newLayer
        }

        return result.map { positionNodes in
            positionNodes.map { positionNode in
                positionNode.node.val
            }
        }
    }

    func addToResult(positionNode: PositionNode) {
        let firstX = result[0][0].x
        let lastX = result.last![0].x
        if positionNode.x < firstX {
            result.insert([positionNode], at: 0)
        } else if positionNode.x > lastX {
            result.append([positionNode])
        } else {
            let index1 = positionNode.x - firstX
            var index2 = result[index1].count
            while index2 > 0 && result[index1][index2 - 1].y == positionNode.y && result[index1][index2 - 1].node.val > positionNode.node.val {
                index2 -= 1
            }
            result[index1].insert(positionNode, at: index2)
        }
    }
}

struct PositionNode {
    let y: Int
    let x: Int
    let node: TreeNode
}
