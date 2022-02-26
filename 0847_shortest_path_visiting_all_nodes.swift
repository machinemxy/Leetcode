// https://leetcode.com/problems/shortest-path-visiting-all-nodes/

class Solution {
    func shortestPathLength(_ graph: [[Int]]) -> Int {
        let nodeCount = graph.count
        if nodeCount == 1 { return 0 }
        var storages = [Storage]()
        var duplicatePreventSet = Set<Storage>()

        // every point is possible to be start point. So add them into storages
        for i in 0..<nodeCount {
            var visited = Array(repeating: false, count: nodeCount)
            visited[i] = true
            let storage = Storage(currentNode: i, visited: visited)
            storages.append(storage)
            duplicatePreventSet.insert(storage)
        }

        var steps = 0
        while true {
            steps += 1
            var newStorages = [Storage]()
            for storage in storages {
                let possibleNextNodes = graph[storage.currentNode]
                for possibleNextNode in possibleNextNodes {
                    var newVisited = storage.visited
                    newVisited[possibleNextNode] = true

                    if newVisited.reduce(0, { $0 + ($1 ? 1 : 0) }) == nodeCount {
                        return steps
                    }

                    let newStorage = Storage(currentNode: possibleNextNode, visited: newVisited)
                    if !duplicatePreventSet.contains(newStorage) {
                        newStorages.append(newStorage)
                        duplicatePreventSet.insert(newStorage)
                    }
                }
            }
            storages = newStorages
        }
    }
}

struct Storage: Hashable {
    var currentNode: Int
    var visited: [Bool]
}
