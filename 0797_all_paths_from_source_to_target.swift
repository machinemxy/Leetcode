// https://leetcode.com/problems/all-paths-from-source-to-target/description/

class Solution {
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        var sources = Array(repeating: Set<Int>(), count: graph.count)
        for (i, directions) in graph.enumerated() {
            for direction in directions {
                sources[direction].insert(i)
            }
        }
        var paths = Array(repeating: [[Int]](), count: graph.count)
        paths[0] = [[0]]
        var queue = [0]
        while !queue.isEmpty {
            let point = queue.removeFirst()
            for direction in graph[point] {
                let pathsWithDirection: [[Int]] = paths[point].map { path in
                    var path = path
                    path.append(direction)
                    return path
                }
                paths[direction] += pathsWithDirection
                sources[direction].remove(point)
                if sources[direction].isEmpty {
                    queue.append(direction)
                }
            }
        }
        return paths[graph.count - 1]
    }
}
