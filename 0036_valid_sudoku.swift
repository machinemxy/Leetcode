// https://leetcode.com/problems/valid-sudoku/

class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        // check each row
        for y in 0...8 {
            var set = Set<Character>()
            for x in 0...8 {
                let cell = board[y][x]
                guard cell != "." else { continue }
                guard !set.contains(cell) else { return false }
                set.insert(cell)
            }
        }
        
        // check each col
        for x in 0...8 {
            var set = Set<Character>()
            for y in 0...8 {
                let cell = board[y][x]
                guard cell != "." else { continue }
                guard !set.contains(cell) else { return false }
                set.insert(cell)
            }
        }
        
        // check each sub-box
        for y in stride(from: 0, through: 6, by: 3) {
            for x in stride(from: 0, through: 6, by: 3) {
                var set = Set<Character>()
                for y2 in y...(y + 2) {
                    for x2 in x...(x + 2) {
                        let cell = board[y2][x2]
                        guard cell != "." else { continue }
                        guard !set.contains(cell) else { return false }
                        set.insert(cell)
                    }
                }
            }
        }
        
        return true
    }
}
