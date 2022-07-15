// https://leetcode.com/problems/max-area-of-island/

class Solution {
	private var grid = [[Int]]()
	private var visited = [[Bool]]()
	private var maxArea = 0
	private var currentArea = 0
	private var rowCount = 0
	private var colCount = 0

	func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
		self.grid = grid
		rowCount = grid.count
		colCount = grid[0].count
		let visitedRow = Array(repeating: false, count: colCount)
		visited = Array(repeating: visitedRow, count: rowCount)

		for y in 0..<rowCount {
			for x in 0..<colCount {
				checkArea(y: y, x: x)

				maxArea = max(maxArea, currentArea)
				currentArea = 0
			}
		}

		return maxArea
	}

	private func checkArea(y: Int, x: Int) {
		if grid[y][x] == 1 && !visited[y][x] {
			currentArea += 1
			visited[y][x] = true

			if x - 1 >= 0 {
				checkArea(y: y, x: x - 1)
			}
			if x + 1 < colCount {
				checkArea(y: y, x: x + 1)
			}
			if y - 1 >= 0 {
				checkArea(y: y - 1, x: x)
			}
			if y + 1 < rowCount {
				checkArea(y: y + 1, x: x)
			}
		}
	}
}
