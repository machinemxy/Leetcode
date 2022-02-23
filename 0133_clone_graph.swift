// https://leetcode.com/problems/clone-graph/

/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var neighbors: [Node?]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.neighbors = []
 *     }
 * }
 */

class Solution {
    private var valDic = Dictionary<Int, [Int]>()

    func cloneGraph(_ node: Node?) -> Node? {
        guard let originNode = node else { return nil }
        addNodeIntoValDic(node: originNode)

        var nodeDic = Dictionary<Int, Node>()

        // init nodes
        for key in valDic.keys {
            nodeDic[key] = Node(key)
        }

        // set neighbors
        for (key, value) in valDic {
            let neighbors = value.map { nodeDic[$0] }
            nodeDic[key]!.neighbors = neighbors
        }

        return nodeDic[originNode.val]
    }

    private func addNodeIntoValDic(node: Node) {
        let neighborVals = node.neighbors.compactMap { $0?.val }
        valDic[node.val] = neighborVals
        for neighbor in node.neighbors {
            if let neighbor  = neighbor {
                if !valDic.keys.contains(neighbor.val) {
                    addNodeIntoValDic(node: neighbor)
                }
            }
        }
    }
}
