// https://leetcode.com/problems/pascals-triangle/

class Solution {
	func generate(_ numRows: Int) -> [[Int]] {
		var result = [[1]]
		var currentRow = [1]
		if numRows == 1 { return result }
		currentRow = [1, 1]
		result.append(currentRow)
		if numRows == 2 { return result }
		for _ in 3...numRows {
			var newRow = [1]
			for j in 0..<(currentRow.count - 1) {
				newRow.append(currentRow[j] + currentRow[j + 1])
			}
			newRow.append(1)
			result.append(newRow)
			currentRow = newRow
		}
		return result
	}
}
