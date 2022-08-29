// https://leetcode.com/problems/number-of-islands/

class Solution {
	var grid = [[Character]]()
	var rowCount = 0
	var colCount = 0

	func numIslands(_ grid: [[Character]]) -> Int {
		var islands = 0
		self.grid = grid
		rowCount = grid.count
		colCount = grid[0].count

		for y in 0..<rowCount {
			for x in 0..<colCount {
				if self.grid[y][x] == "1" {
					self.grid[y][x] = "0"
					islands += 1
					removeAdjacentLand(y: y, x: x)
				}
			}
		}

		return islands
	}

	func removeAdjacentLand(y: Int, x: Int) {
		if x < (colCount - 1) {
			if grid[y][x + 1] == "1" {
				grid[y][x + 1] = "0"
				removeAdjacentLand(y: y, x: x + 1)
			}
		}

		if y < (rowCount - 1) {
			if grid[y + 1][x] == "1" {
				grid[y + 1][x] = "0"
				removeAdjacentLand(y: y + 1, x: x)
			}
		}

		if x > 0 {
			if grid[y][x - 1] == "1" {
				grid[y][x - 1] = "0"
				removeAdjacentLand(y: y, x: x - 1)
			}
		}

		if y > 0 {
			if grid[y - 1][x] == "1" {
				grid[y - 1][x] = "0"
				removeAdjacentLand(y: y - 1, x: x)
			}
		}
	}
}
