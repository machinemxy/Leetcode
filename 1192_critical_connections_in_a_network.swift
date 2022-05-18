// https://leetcode.com/problems/critical-connections-in-a-network/

class Solution {
    private var adjancences = [[Int]]()
    private var ranks = [Int]()
    private var connectionSet = Set<[Int]>()

    func criticalConnections(_ n: Int, _ connections: [[Int]]) -> [[Int]] {
        for connection in connections {
            connectionSet.insert(connection.sorted())
        }

        adjancences = Array(repeating: [Int](), count: n)
        for connection in connectionSet {
            adjancences[connection[0]].append(connection[1])
            adjancences[connection[1]].append(connection[0])
        }

        ranks = Array(repeating: -2, count: n)

        dfs(i: 0, rank: 0)
        return Array(connectionSet)
    }

    private func dfs(i: Int, rank: Int) -> Int {
        if ranks[i] >= 0 {
            return ranks[i]
        }

        ranks[i] = rank
        var minRank = rank
        for adjancentId in adjancences[i] {
            if ranks[adjancentId] == rank - 1 {
                continue
            }
            let adjancentRank = dfs(i: adjancentId, rank: rank + 1)
            if adjancentRank <= rank {
                connectionSet.remove([i, adjancentId].sorted())
            }
            minRank = min(minRank, adjancentRank)
        }

        return minRank
    }
}
