// https://leetcode.com/problems/cherry-pickup-ii/
// This is a solution using Dynamic Programming? Though it is slower than my Recursion.

class Solution {
    private var grid = [[Int]]()
    private var maxRow = Int.max
    private var maxCol = Int.max
    private var memo = Dictionary<Position, Int>()

    func cherryPickup(_ grid: [[Int]]) -> Int {
        self.grid = grid
        maxRow = grid.count
        maxCol = grid[0].count

        // last row
        for l in 0..<maxCol {
            for r in l..<maxCol {
                let position = Position(row: maxRow - 1, l: l, r: r)
                if l == r {
                    memo[position] = grid[maxRow - 1][l]
                } else {
                    memo[position] = grid[maxRow - 1][l] + grid[maxRow - 1][r]
                }
            }
        }

        // other rows
        for row in stride(from: maxRow - 2, through: 0, by: -1) {
            for l in 0..<maxCol {
                for r in l..<maxCol {
                    let cherry: Int
                    if l == r {
                        cherry = grid[row][l]
                    } else {
                        cherry = grid[row][l] + grid[row][r]
                    }

                    var maxRest = Int.min
                    for i in -1...1 {
                        for j in -1...1 {
                            let nextL = l + i
                            let nextR = r + j
                            if nextL > nextR { continue }
                            if nextL < 0 { continue }
                            if nextR >= maxCol { continue }
                            if let rest = memo[Position(row: row + 1, l: nextL, r: nextR)] {
                                maxRest = max(maxRest, rest)
                            }
                        }
                    }

                    memo[Position(row: row, l: l, r: r)] = cherry + maxRest
                }
            }
        }

        return memo[Position(row: 0, l: 0, r: maxCol - 1)] ?? Int.min
    }
}

struct Position: Hashable {
    let row: Int
    let l: Int
    let r: Int
}
