// https://leetcode.com/problems/triangle/

class Solution {
	func minimumTotal(_ triangle: [[Int]]) -> Int {
		if triangle.count == 1 { return triangle[0][0] }
		var triangle = triangle
		for i in 1..<triangle.count {
			triangle[i][0] += triangle[i - 1][0]

			let countInRow = triangle[i].count
			if countInRow >= 3 {
				for j in 1..<(countInRow - 1) {
					triangle[i][j] += min(triangle[i - 1][j], triangle[i - 1][j - 1])
				}
			}

			triangle[i][countInRow - 1] += triangle[i - 1][countInRow - 2]
		}

		return triangle.last!.reduce(Int.max) { min($0, $1) }
	}
}
