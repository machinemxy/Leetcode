// https://leetcode.com/problems/count-sorted-vowel-strings/

class Solution {
	func countVowelStrings(_ n: Int) -> Int {
		guard n > 1 else { return 5 }

		let row = Array(repeating: 0, count: 5)
		var matrix = Array(repeating: row, count: n)

		for i in 0..<5 {
			matrix[0][i] = i + 1
		}

		for i in 1..<n {
			var temp = 0

			for j in 0..<5 {
				temp += matrix[i - 1][j]
				matrix[i][j] = temp
			}
		}

		return matrix[n - 1][4]
	}
}
