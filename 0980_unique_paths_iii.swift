// https://leetcode.com/problems/unique-paths-iii/description/

class Solution {
    var result = 0
    
    func uniquePathsIII(_ grid: [[Int]]) -> Int {
        var currentY = 0
        var currentX = 0
        var restEmptySquares = 0
        for y in 0..<grid.count {
            for x in 0..<grid[0].count {
                if grid[y][x] == 1 {
                    currentY = y
                    currentX = x
                    restEmptySquares += 1
                } else if grid[y][x] == 0 {
                    restEmptySquares += 1
                }
            }
        }
        walk(grid: grid, currentY: currentY, currentX: currentX, restEmptySquares: restEmptySquares)
        return result
    }
    
    func walk(grid: [[Int]], currentY: Int, currentX: Int, restEmptySquares: Int) {
        var grid = grid
        var restEmptySquares = restEmptySquares
        let currentSquare = grid[currentY][currentX]
        if currentSquare == 0 || currentSquare == 1 {
            grid[currentY][currentX] = -1
            restEmptySquares -= 1
        } else if currentSquare == 2 {
            if restEmptySquares == 0 {
                result += 1
            }
            return
        } else {
            return
        }
        
        if currentY > 0 {
            walk(grid: grid, currentY: currentY - 1, currentX: currentX, restEmptySquares: restEmptySquares)
        }
        if currentY < grid.count - 1 {
            walk(grid: grid, currentY: currentY + 1, currentX: currentX, restEmptySquares: restEmptySquares)
        }
        if currentX > 0 {
            walk(grid: grid, currentY: currentY, currentX: currentX - 1, restEmptySquares: restEmptySquares)
        }
        if currentX < grid[0].count - 1 {
            walk(grid: grid, currentY: currentY, currentX: currentX + 1, restEmptySquares: restEmptySquares)
        }
    }
}
