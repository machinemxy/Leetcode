// https://leetcode.com/problems/cherry-pickup-ii/

class Solution {
    private var grid = [[Int]]()
    private var maxRow = Int.max
    private var maxCol = Int.max
    private var memo = Dictionary<Position, Int>()

    func cherryPickup(_ grid: [[Int]]) -> Int {
        self.grid = grid
        maxRow = grid.count
        maxCol = grid[0].count

        return pick(row: 0, l: 0, r: maxCol - 1)
    }

    private func pick(row: Int, l: Int, r: Int) -> Int {
        if let cache = memo[Position(row: row, l: l, r: r)] {
            return cache
        }

        let cherry: Int
        if l == r {
            cherry = grid[row][l]
        } else {
            cherry = grid[row][l] + grid[row][r]
        }
        if row == maxRow - 1 {
            memo[Position(row: row, l: l, r: r)] = cherry
            return cherry
        }

        var bestRest = 0
        for i in -1...1 {
            for j in -1...1 {
                let newL = l + i
                let newR = r + j
                if newL > newR {
                    continue
                }
                if newL < 0 {
                    continue
                }
                if newR >= maxCol {
                    continue
                }
                let rest = pick(row: row + 1, l: newL, r: newR)
                if rest > bestRest {
                    bestRest = rest
                }
            }
        }

        memo[Position(row: row, l: l, r: r)] = cherry + bestRest
        return cherry + bestRest
    }
}

struct Position: Hashable {
    let row: Int
    let l: Int
    let r: Int
}
