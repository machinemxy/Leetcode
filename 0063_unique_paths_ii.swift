// https://leetcode.com/problems/unique-paths-ii/

class Solution {
	func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
		let m = obstacleGrid.count
		let n = obstacleGrid[0].count

		let emptyRow = Array(repeating: 0, count: n)
		var solution = Array(repeating: emptyRow, count: m)

		for i in stride(from: m - 1, through: 0, by: -1) {
			for j in stride(from: n - 1, through: 0, by: -1) {
				if obstacleGrid[i][j] == 1 {
					solution[i][j] = 0
				} else if i == m - 1 && j == n - 1 {
					solution[i][j] = 1
				} else {
					var steps = 0

					if i < m - 1 {
						steps += solution[i + 1][j]
					}

					if j < n - 1 {
						steps += solution[i][j + 1]
					}

					solution[i][j] = steps
				}
			}
		}

		return solution[0][0]
	}
}
