// https://leetcode.com/problems/spiral-matrix-ii/

class Solution {
	private enum Direction {
		case left, right, up, down
	}

	func generateMatrix(_ n: Int) -> [[Int]] {
		let row = Array(repeating: 0, count: n)
		var matrix = Array(repeating: row, count: n)

		var i = 0
		var j = -1
		var direction = Direction.right

		for num in 1...(n * n) {
			switch direction {
				case .right:
					if j + 1 == n || matrix[i][j + 1] != 0 {
						direction = .down
						i += 1
					} else {
						j += 1
					}
				case .down:
					if i + 1 == n || matrix[i + 1][j] != 0 {
						direction = .left
						j -= 1
					} else {
						i += 1
					}
				case .left:
					if j - 1 < 0 || matrix[i][j - 1] != 0 {
						direction = .up
						i -= 1
					} else {
						j -= 1
					}
				case .up:
					if i - 1 < 0 || matrix[i - 1][j] != 0 {
						direction = .right
						j += 1
					} else {
						i -= 1
					}
			}

			matrix[i][j] = num
		}

		return matrix
	}
}
