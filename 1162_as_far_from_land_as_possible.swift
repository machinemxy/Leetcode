// https://leetcode.com/problems/as-far-from-land-as-possible/description/

class Solution {
	func maxDistance(_ grid: [[Int]]) -> Int {
		var grid = grid
		var steps = 0
		var lands = [Point]()
		let n = grid.count
		for i in 0..<n {
			for j in 0..<n {
				if grid[i][j] == 1 {
					lands.append(Point(y: i, x: j))
				}
			}
		}
		while !lands.isEmpty {
			let landsCount = lands.count
			for _ in 0..<landsCount {
				let land = lands.removeFirst()

				if land.y != 0 {
					if grid[land.y - 1][land.x] == 0 {
						grid[land.y - 1][land.x] = 1
						lands.append(Point(y: land.y - 1, x: land.x))
					}
				}

				if land.y != n - 1 {
					if grid[land.y + 1][land.x] == 0 {
						grid[land.y + 1][land.x] = 1
						lands.append(Point(y: land.y + 1, x: land.x))
					}
				}

				if land.x != 0 {
					if grid[land.y][land.x - 1] == 0 {
						grid[land.y][land.x - 1] = 1
						lands.append(Point(y: land.y, x: land.x - 1))
					}
				}

				if land.x != n - 1 {
					if grid[land.y][land.x + 1] == 0 {
						grid[land.y][land.x + 1] = 1
						lands.append(Point(y: land.y, x: land.x + 1))
					}
				}
			}
			steps += 1
		}
		return steps == 1 ? -1 : (steps - 1)
	}
}

struct Point {
	let y: Int
	let x: Int
}
