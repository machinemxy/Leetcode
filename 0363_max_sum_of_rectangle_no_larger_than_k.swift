// https://leetcode.com/problems/max-sum-of-rectangle-no-larger-than-k/

class Solution {
	func maxSumSubmatrix(_ matrix: [[Int]], _ k: Int) -> Int {
		var sumMatrix = matrix
		let rowCount = sumMatrix.count
		let colCount = sumMatrix[0].count

		if colCount > 1 {
			for i in 0..<rowCount {
				for j in 1..<colCount {
					sumMatrix[i][j] += sumMatrix[i][j - 1]
				}
			}
		}

		if rowCount > 1 {
			for j in 0..<colCount {
				for i in 1..<rowCount {
					sumMatrix[i][j] += sumMatrix[i - 1][j]
				}
			}
		}

		var result = Int.min
		for yBig in 0..<rowCount {
			for xBig in 0..<colCount {
				for ySmall in (-1)..<yBig {
					for xSmall in (-1)..<xBig {
						let sum: Int
						if ySmall == -1 && xSmall == -1 {
							sum = sumMatrix[yBig][xBig]
						} else if ySmall == -1 {
							sum = sumMatrix[yBig][xBig] - sumMatrix[yBig][xSmall]
						} else if xSmall == -1 {
							sum = sumMatrix[yBig][xBig] - sumMatrix[ySmall][xBig]
						} else {
							sum = sumMatrix[yBig][xBig] - sumMatrix[yBig][xSmall] - sumMatrix[ySmall][xBig] + sumMatrix[ySmall][xSmall]
						}
						if sum == k {
							return k
						} else if sum < k {
							result = max(result, sum)
						}
					}
				}
			}
		}
		return result
	}
}
