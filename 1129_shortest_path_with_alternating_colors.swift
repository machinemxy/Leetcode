// https://leetcode.com/problems/shortest-path-with-alternating-colors/description/

class Solution {
    func shortestAlternatingPaths(_ n: Int, _ redEdges: [[Int]], _ blueEdges: [[Int]]) -> [Int] {
        var redDic = [Int: Set<Int>]()
        var blueDic = [Int: Set<Int>]()
        for redEdge in redEdges {
            redDic[redEdge[0], default: []].insert(redEdge[1])
        }
        for blueEdge in blueEdges {
            blueDic[blueEdge[0], default: []].insert(blueEdge[1])
        }
        var redVisited = Array(repeating: false, count: n)
        var blueVisited = Array(repeating: false, count: n)
        var result = Array(repeating: -1, count: n)
        redVisited[0] = true
        blueVisited[0] = true
        result[0] = 0
        var steps = 1
        var redNodes = [0]
        var blueNodes = [0]
        while !redNodes.isEmpty || !blueNodes.isEmpty {
            let redCount = redNodes.count
            let blueCount = blueNodes.count
            for _ in 0..<redCount {
                let redNode = redNodes.removeFirst()
                for nextNode in blueDic[redNode, default: []] where !blueVisited[nextNode] {
                    blueNodes.append(nextNode)
                    blueVisited[nextNode] = true
                    if result[nextNode] == -1 {
                        result[nextNode] = steps
                    }
                }
            }
            for _ in 0..<blueCount {
                let blueNode = blueNodes.removeFirst()
                for nextNode in redDic[blueNode, default: []] where !redVisited[nextNode] {
                    redNodes.append(nextNode)
                    redVisited[nextNode] = true
                    if result[nextNode] == -1 {
                        result[nextNode] = steps
                    }
                }
            }
            steps += 1
        }
        return result
    }
}
