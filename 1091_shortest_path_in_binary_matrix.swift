// https://leetcode.com/problems/shortest-path-in-binary-matrix/

class Solution {
	func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
		let n = grid.count
		if grid[0][0] == 1 { return -1 }
		if n == 1 { return 1 }

		let visitedRow = Array(repeating: false, count: n)
		var visited = Array(repeating: visitedRow, count: n)
		visited[0][0] = true

		let targetPoint = Point(y: n - 1, x: n - 1)
		var points = [Point(y: 0, x: 0)]
		var steps = 2

		while !points.isEmpty {
			var newPoints = [Point]()

			for point in points {
				for i in -1...1 {
					let newY = point.y + i
					if newY < 0 || newY >= n { continue }

					for j in -1...1 {
						let newX = point.x + j
						if newX < 0 || newX >= n { continue }
						if grid[newY][newX] == 1 || visited[newY][newX] {
							continue
						}
						let newPoint = Point(y: newY, x: newX)
						if newPoint == targetPoint {
							return steps
						} else {
							newPoints.append(newPoint)
							visited[newY][newX] = true
						}
					}
				}
			}

			steps += 1
			points = newPoints
		}

		return -1
	}
}

fileprivate struct Point: Equatable {
	let y: Int
	let x: Int
}
