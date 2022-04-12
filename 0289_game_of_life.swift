// https://leetcode.com/problems/game-of-life/

class Solution {
	func gameOfLife(_ board: inout [[Int]]) {
		let xCount = board.first!.count
		let yCount = board.count

		let liveBoardRow = Array(repeating: 0, count: xCount)
		var liveBoard = Array(repeating: liveBoardRow, count: yCount)

		for i in 0..<yCount {
			for j in 0..<xCount {
				var liveCount = 0
				if i  > 0 {
					if j > 0 {
						liveCount += board[i - 1][j - 1]
					}

					liveCount += board[i - 1][j]

					if j < xCount - 1 {
						liveCount += board [i - 1][j + 1]
					}
				}

				if j > 0 {
					liveCount += board[i][j - 1]
				}

				if j < xCount - 1 {
					liveCount += board [i][j + 1]
				}

				if i < yCount - 1 {
					if j > 0 {
						liveCount += board[i + 1][j - 1]
					}

					liveCount += board[i + 1][j]

					if j < xCount - 1 {
						liveCount += board [i + 1][j + 1]
					}
				}

				liveBoard[i][j] = liveCount
			}
		}

		for i in 0..<yCount {
			for j in 0..<xCount {
				if board[i][j] == 0 {
					if liveBoard[i][j] == 3 {
						board[i][j] = 1
					}
				} else {
					if liveBoard[i][j] < 2 || liveBoard[i][j] > 3 {
						board[i][j] = 0
					}
				}
			}
		}
	}
}
