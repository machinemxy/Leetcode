// https://leetcode.com/problems/rotate-image/

class Solution {
	func rotate(_ matrix: inout [[Int]]) {
		let length = matrix.count
		if length == 1 { return }
		for y in 0..<(length / 2) {
			for x in y..<(length - 1 - y) {
				let temp = matrix[y][x]
				matrix[y][x] = matrix[length - 1 - x][y]
				matrix[length - 1 - x][y] = matrix[length - 1 - y][length - 1 - x]
				matrix[length - 1 - y][length - 1 - x] = matrix[x][length - 1 - y]
				matrix[x][length - 1 - y] = temp
			}
		}
	}
}
