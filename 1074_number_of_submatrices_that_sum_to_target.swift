// https://leetcode.com/problems/number-of-submatrices-that-sum-to-target/

class Solution {
    func numSubmatrixSumTarget(_ matrix: [[Int]], _ target: Int) -> Int {
        let rowCount = matrix.count
        let colCount = matrix[0].count
        let sumMatrixRow = Array(repeating: 0, count: colCount)
        var sumMatrix = Array(repeating: sumMatrixRow, count: rowCount)
        sumMatrix[0] = matrix[0]
        if rowCount > 1 {
            for i in 1..<rowCount {
                for j in 0..<colCount {
                    sumMatrix[i][j] = sumMatrix[i - 1][j] + matrix[i][j]
                }
            }
        }

        var result = 0

        for startRow in 0..<rowCount {
            for endRow in startRow..<rowCount {
                var sumFrequencyDic: Dictionary<Int, Int> = [0: 1]
                var sum = 0
                for i in 0..<colCount {
                    sum = sum + sumMatrix[endRow][i] - (startRow == 0 ? 0 : sumMatrix[startRow - 1][i])
                    if let frequency = sumFrequencyDic[sum - target] {
                        result += frequency
                    }
                    sumFrequencyDic[sum] = sumFrequencyDic[sum, default: 0] + 1
                }
            }
        }

        return result
    }
}
