// https://leetcode.com/problems/equal-row-and-column-pairs/description/

class Solution {
    func equalPairs(_ grid: [[Int]]) -> Int {
        var map = [[Int]: Int]()
        for row in grid {
            map[row] = (map[row] ?? 0) + 1
        }
        let n = grid.count
        var result = 0
        for i in 0..<n {
            var column = [Int]()
            for j in 0..<n {
                column.append(grid[j][i])
            }
            if let count = map[column] {
                result += count
            }
        }
        return result
    }
}
