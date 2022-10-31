// https://leetcode.com/problems/toeplitz-matrix/

class Solution {
	func isToeplitzMatrix(_ matrix: [[Int]]) -> Bool {
		let rowCount = matrix.count
		let colCount = matrix.first!.count
		if rowCount == 1 || colCount == 1 {
			return true
		}
		for i in 1..<rowCount {
			var y = i
			var x = 1
			while y < rowCount && x < colCount {
				if matrix[y][x] != matrix[y - 1][x - 1] {
					return false
				}
				y += 1
				x += 1
			}
		}
		for i in 1..<colCount {
			var y = 1
			var x = i
			while y < rowCount && x < colCount {
				if matrix[y][x] != matrix[y - 1][x - 1] {
					return false
				}
				y += 1
				x += 1
			}
		}
		return true
	}
}
