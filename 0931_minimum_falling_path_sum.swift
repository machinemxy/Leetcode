// https://leetcode.com/problems/minimum-falling-path-sum/description/

class Solution {
	func minFallingPathSum(_ matrix: [[Int]]) -> Int {
		let length = matrix.count
		guard length > 1 else { return matrix[0][0] }
		let dpRow = Array(repeating: 0, count: length)
		var dpMatrix = Array(repeating: dpRow, count: length)
		dpMatrix[0] = matrix[0]
		for i in 1..<length {
			for j in 0..<length {
				if j == 0 {
					dpMatrix[i][j] = min(dpMatrix[i - 1][j], dpMatrix[i - 1][j + 1]) + matrix[i][j]
				} else if j == length - 1 {
					dpMatrix[i][j] = min(dpMatrix[i - 1][j - 1], dpMatrix[i - 1][j]) + matrix[i][j]
				} else {
					dpMatrix[i][j] = min(dpMatrix[i - 1][j - 1], dpMatrix[i - 1][j], dpMatrix[i - 1][j + 1]) + matrix[i][j]
				}
			}
		}
		var minFallingPathSum = Int.max
		for i in 0..<length {
			minFallingPathSum = min(minFallingPathSum, dpMatrix[length - 1][i])
		}
		return minFallingPathSum
	}
}
