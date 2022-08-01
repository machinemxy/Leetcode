// https://leetcode.com/problems/unique-paths/

class Solution {
	func uniquePaths(_ m: Int, _ n: Int) -> Int {
		if m == 1 || n == 1 { return 1 }
		let fistRow = Array(repeating: 1, count: n)
		var otherRow = Array(repeating: 0, count: n)
		otherRow[0] = 1
		var matrix = Array(repeating: otherRow, count: m)
		matrix[0] = fistRow

		for i in 1..<m {
			for j in 1..<n {
				matrix[i][j] = matrix[i - 1][j] + matrix[i][j - 1]
			}
		}

		return matrix[m - 1][n - 1]
	}
}
