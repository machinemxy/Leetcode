// https://leetcode.com/problems/where-will-the-ball-fall/

class Solution {
	var grid = [[Int]]()
	var rowCount = 0
	var colCount = 0

	func findBall(_ grid: [[Int]]) -> [Int] {
		self.grid = grid
		rowCount = grid.count
		colCount = grid.first!.count
		return Array(0..<colCount).map { dropBall(x: $0) }
	}

	func dropBall(x: Int) -> Int {
		var p = Position(y: 0, x: x)
		while true {
			if let nextP = move(p: p) {
				if nextP.y == rowCount {
					return nextP.x
				} else {
					p = nextP
				}
			} else {
				return -1
			}
		}
	}

	func move(p: Position) -> Position? {
		if grid[p.y][p.x] == 1 {
			if p.x + 1 < colCount && grid[p.y][p.x + 1] == 1 {
				return Position(y: p.y + 1, x: p.x + 1)
			} else {
				return nil
			}
		} else {
			if p.x - 1 >= 0 && grid[p.y][p.x - 1] == -1 {
				return Position(y: p.y + 1, x: p.x - 1)
			} else {
				return nil
			}
		}
	}
}

struct Position {
	let y: Int
	let x: Int
}
