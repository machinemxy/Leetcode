// https://leetcode.com/problems/is-graph-bipartite/

/*
 Use 1 and -1 to mark two different group.
 For example graph = [[1,3],[0,2],[1,3],[0,2]]
 Set groups[0] as 1
 Because node 0 connect with 1 and 3, set groups[1] and groups[3] as -1
 Because node 1 connect with 0 and 2, and groups[0] is already 1, so set groups[2] as 1
 ...
 If there is any conflict happened, return false.
*/

class Solution {
    var graph = [[Int]]()
    var groups = [Int]()

    func isBipartite(_ graph: [[Int]]) -> Bool {
        self.graph = graph
        let nodeCount = graph.count
        groups = Array(repeating: 0, count: nodeCount)

        for i in 0..<nodeCount {
            if groups[i] == 0 {
                do {
                    try setGroup(i: i, group: 1)
                } catch {
                    return false
                }
            }
        }

        return true
    }

    private func setGroup(i: Int, group: Int) throws {
        if groups[i] == group {
            return
        } else if groups[i] == -group {
            throw GroupConflict()
        } else {
            groups[i] = group
            for node in graph[i] {
                try setGroup(i: node, group: -group)
            }
        }
    }
}

fileprivate struct GroupConflict: Error {}
