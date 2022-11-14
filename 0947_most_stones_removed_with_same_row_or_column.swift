// https://leetcode.com/problems/most-stones-removed-with-same-row-or-column/

class Solution {
    var stones = [[Int]]()
    var visited = Set<Int>()
    
    func removeStones(_ stones: [[Int]]) -> Int {
        self.stones = stones
        var countCannotRemove = 0
        for i in 0..<stones.count where !visited.contains(i) {
            visited.insert(i)
            countCannotRemove += 1
            remove(prev: i)
        }
        return visited.count - countCannotRemove
    }
    
    func remove(prev: Int) {
        for i in 0..<stones.count where !visited.contains(i) {
            if stones[i][0] == stones[prev][0] || stones[i][1] == stones[prev][1] {
                visited.insert(i)
                remove(prev: i)
            }
        }
    }
}
