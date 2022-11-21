// https://leetcode.com/problems/nearest-exit-from-entrance-in-maze/

class Solution {
	func nearestExit(_ maze: [[Character]], _ entrance: [Int]) -> Int {
		var walls = maze.map { row in
			row.map { $0 == "+" }
		}
		let rowCount = walls.count
		let colCount = walls.first!.count
		var stack = [entrance]
		var steps = 1
		walls[entrance[0]][entrance[1]] = true
		while !stack.isEmpty {
			let count = stack.count
			for _ in 0..<count {
				let position = stack.removeFirst()
				let y = position[0]
				let x = position[1]
				if y - 1 >= 0 && !walls[y - 1][x] {
					if isExit(y: y - 1, x: x, rowCount: rowCount, colCount: colCount) {
						return steps
					}
					walls[y - 1][x] = true
					stack.append([y - 1, x])
				}
				if y + 1 < rowCount && !walls[y + 1][x] {
					if isExit(y: y + 1, x: x, rowCount: rowCount, colCount: colCount) {
						return steps
					}
					walls[y + 1][x] = true
					stack.append([y + 1, x])
				}
				if x - 1 >= 0 && !walls[y][x - 1] {
					if isExit(y: y, x: x - 1, rowCount: rowCount, colCount: colCount) {
						return steps
					}
					walls[y][x - 1] = true
					stack.append([y, x - 1])
				}
				if x + 1 < colCount && !walls[y][x + 1] {
					if isExit(y: y, x: x + 1, rowCount: rowCount, colCount: colCount) {
						return steps
					}
					walls[y][x + 1] = true
					stack.append([y, x + 1])
				}
			}
			steps += 1
		}
		return -1
	}

	func isExit(y: Int, x: Int, rowCount: Int, colCount: Int) -> Bool {
		y == 0 || y == rowCount - 1 || x == 0 || x == colCount - 1
	}
}
