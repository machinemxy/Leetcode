// https://leetcode.com/problems/snakes-and-ladders/description/

class Solution {
	func snakesAndLadders(_ board: [[Int]]) -> Int {
		let n = board.count
		let goal = n * n
		var linearBoard = [0]
		var leftToRight = true
		for i in stride(from: n - 1, through: 0, by: -1) {
			if leftToRight {
				linearBoard += board[i]
			} else {
				linearBoard += board[i].reversed()
			}
			leftToRight = !leftToRight
		}
		var currentPositions = [1]
		var visited = Array(repeating: false, count: goal + 1)
		visited[1] = true
		var steps = 1
		while !currentPositions.isEmpty {
			let currentPositionsCount = currentPositions.count
			for _ in 0..<currentPositionsCount {
				let currentPosition = currentPositions.removeFirst()
				var maxNormalWalkPosition = 0
				for i in 1...6 {
					let nextPosition = currentPosition + i
					if nextPosition == goal {
						return steps
					}
					let boardValue = linearBoard[nextPosition]
					if boardValue == -1 {
						visited[nextPosition] = true
						maxNormalWalkPosition = nextPosition
					} else if !visited[boardValue] {
						if boardValue == goal {
							return steps
						}
						visited[boardValue] = true
						currentPositions.append(boardValue)
					}
				}
				if maxNormalWalkPosition > 0 {
					currentPositions.append(maxNormalWalkPosition)
				}
			}
			steps += 1
		}
		return -1
	}
}
