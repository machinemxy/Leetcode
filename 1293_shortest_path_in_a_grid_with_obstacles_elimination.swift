// https://leetcode.com/problems/shortest-path-in-a-grid-with-obstacles-elimination/

class Solution {
    func shortestPath(_ grid: [[Int]], _ k: Int) -> Int {
        let rowCount = grid.count
        let colCount = grid.first!.count
        let visitedRow = Array(repeating: -1, count: colCount)
        var visited = Array(repeating: visitedRow, count: rowCount)
        var ys = [0]
        var xs = [0]
        var rs = [k]
        var steps = 0
        while !ys.isEmpty {
            let arrayCount = ys.count
            for _ in 0..<arrayCount {
                let y = ys.removeFirst()
                let x = xs.removeFirst()
                let r = rs.removeFirst()
                if r <= visited[y][x] {
                    continue
                }
                if y == rowCount - 1 && x == colCount - 1 {
                    return steps
                }
                visited[y][x] = r
                
                if y - 1 >= 0 {
                    let newR = r - grid[y - 1][x]
                    ys.append(y - 1)
                    xs.append(x)
                    rs.append(newR)
                }
                
                if y + 1 < rowCount {
                    let newR = r - grid[y + 1][x]
                    ys.append(y + 1)
                    xs.append(x)
                    rs.append(newR)
                }
                
                if x - 1 >= 0 {
                    let newR = r - grid[y][x - 1]
                    ys.append(y)
                    xs.append(x - 1)
                    rs.append(newR)
                }
                
                if x + 1 < colCount {
                    let newR = r - grid[y][x + 1]
                    ys.append(y)
                    xs.append(x + 1)
                    rs.append(newR)
                }
            }
            steps += 1
        }
        return -1
    }
}
