// https://leetcode.com/problems/cherry-pickup-ii/

struct Position: Hashable {
    let row: Int
    let l: Int
    let r: Int
}

// Recursion
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


// DP
class Solution2 {
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
